Algoritmo AsignacionDiasEstudio
	
	Definir i,j,k Como Entero
	Definir numCursos,diasTotales Como Entero
	Definir cursoIdx Como Entero
	Definir kMin,kMax Como Entero
	Definir beneficio,maxBeneficio Como Entero
	Definir mejorK Como Entero
	Definir diasRestantes Como Entero
	Definir total Como Entero
	Definir beneficios Como Entero
	Definir pd Como Entero
	Definir decision Como Entero
	Definir dias Como Entero
	Definir puntos Como Entero

	
    Dimension beneficios[4,5]
    Dimension pd[5,8]
    Dimension decision[5,8]
    Dimension dias[4]
    Dimension puntos[4]
	
    beneficios[0,0]=0
    beneficios[0,1]=1
    beneficios[0,2]=3
    beneficios[0,3]=6
    beneficios[0,4]=8
	
    beneficios[1,0]=0
    beneficios[1,1]=5
    beneficios[1,2]=6
    beneficios[1,3]=8
    beneficios[1,4]=8
	
    beneficios[2,0]=0
    beneficios[2,1]=4
    beneficios[2,2]=6
    beneficios[2,3]=7
    beneficios[2,4]=9
	
    beneficios[3,0]=0
    beneficios[3,1]=4
    beneficios[3,2]=4
    beneficios[3,3]=5
    beneficios[3,4]=8
	
    numCursos <- 4
    diasTotales <- 7
	
    Para i<-0 Hasta numCursos
        Para j<-0 Hasta diasTotales
            pd[i,j] <- -999999
            decision[i,j] <- 0
        FinPara
    FinPara
	
    pd[0,0] <- 0
	
    Para i<-1 Hasta numCursos
		
        Para j<-i Hasta diasTotales
			
            maxBeneficio <- -999999
            mejorK <- 0
            cursoIdx <- i-1
			
            kMin <- 1
			
            kMax <- 4
			
            Si j<kMax Entonces
                kMax <- j
            FinSi
			
            Si (j-(i-1))<kMax Entonces
                kMax <- j-(i-1)
            FinSi
			
            Para k<-kMin Hasta kMax
				
                beneficio <- beneficios[cursoIdx,k] + pd[i-1,j-k]
				
                Si beneficio>maxBeneficio Entonces
                    maxBeneficio <- beneficio
                    mejorK <- k
                FinSi
				
            FinPara
			
            pd[i,j] <- maxBeneficio
            decision[i,j] <- mejorK
			
        FinPara
		
    FinPara
	
    diasRestantes <- diasTotales
	
    Para i<-numCursos Hasta 1 Con Paso -1
		
        dias[i-1] <- decision[i,diasRestantes]
		
        puntos[i-1] <- beneficios[i-1,dias[i-1]]
		
        diasRestantes <- diasRestantes-dias[i-1]
		
    FinPara
	
    total <- 0
	
    Escribir "=============================="
    Escribir "ASIGNACION OPTIMA DE DIAS"
    Escribir "=============================="
	
    Para i<-0 Hasta numCursos-1
		
        Escribir "Curso ",i+1,": ",dias[i]," dias -> ",puntos[i]," puntos"
		
        total <- total+puntos[i]
		
    FinPara
	
    Escribir "------------------------------"
    Escribir "TOTAL: ",total," puntos"
	
FinAlgoritmo