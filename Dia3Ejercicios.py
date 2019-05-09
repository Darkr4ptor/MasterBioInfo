#
#   Realizar un programa que pida al usuario el nombre de un fichero, lo abra, 
#   cuente cuántas palabras de cada tipo existen y lo muestre por pantalla.
#
#   % de tipo de bases


#Global ACTG count

AdenineCount  = 0;
CitosineCount = 0;
GuanineCount  = 0;
ThymineCount  = 0;

sourceFile      = input("Especifique el nombre de un fichero: \n")
destinationFile = input("Especifique donde guardar los resultados: \n")
  
    #We should be using Path in Python 3.x but let's keep it simple
try:
        rawFile = open(sourceFile);

        lineCount = 1;


        for lineToRead in rawFile:


            lineToRead.upper();
            
            lineAdenineCount = lineToRead.count("A");
            lineGuanineCount = lineToRead.count("G");
            lineThymineCount = lineToRead.count("T");
            lineCitosineCount = lineToRead.count("C");

            AdenineCount  += lineAdenineCount;
            CitosineCount += lineCitosineCount;
            GuanineCount  += lineGuanineCount;
            ThymineCount  += lineThymineCount;

            print("There are ", lineAdenineCount, " adenines in line: ", lineCount);
            print("There are ", lineGuanineCount, " guanines in line: ", lineCount);
            print("There are ", lineCitosineCount, " citosines in line: ", lineCount);
            print("There are ", lineThymineCount, " thymines in line: ", lineCount);
            lineCount += 1;

        rawFile.close();
        totalNucleotideCount = AdenineCount + CitosineCount + GuanineCount + ThymineCount;
        
        adenineQuantity = (AdenineCount / totalNucleotideCount) * 100;
        print("Relative adenine quantity is ", adenineQuantity, "%");

        #saving results to file
        print("Saving to file...");
        
        #I'm too lazy to write the whole report to the file, but this should serve as an example
        SavedFile = open(destinationFile, 'w');
        SavedFile.write("Adenine quantity is " + str(adenineQuantity));
        SavedFile.close();


except FileNotFoundError: #we should not use exceptions to control the program behaviour, but to control error handling
        print("Fichero no encontrado");
