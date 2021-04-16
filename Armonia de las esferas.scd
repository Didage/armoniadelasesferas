/**************************************************************************************
*
*    Código por Diego Alejandro Tovar para la clase de Mundos Lejanos 2021
*
*    Este es un programa que genera ondas sinusoidales  con frecuencias análogas a las
*    distancias que se generan entre la tierra y los planetas.
*
**************************************************************************************/
// Variables para las freq de cada planeta
var fMercurio;
var fVenus;
var fMarte;
var fJupiter;
var fSaturno;
var fUrano;
var fNeptuno;
var fSol;

// Variable para la función que calcula la frecuencia de cada planeta.
var freqPlaneta;

//función que calcula la  frecuencia asociada a una distancia heliocéntrica en UA <x>, un periodo orbital en días <p>, un tiempo recorrido en días<t>
freqPlaneta = {
	arg x, p, t;
	var tierraEnX;
	var tierraEnY;
	var planetaEnX;
	var planetaEnY;
	var r;
	var freq;

	tierraEnX = cos((2*pi*t)/365.26);
	tierraEnY = sin((2*pi*t)/365.26);


	planetaEnX = x*cos((2*pi*t)/p);
	planetaEnY = x*sin((2*pi*t)/p);

	r = sqrt(squared(planetaEnX - tierraEnX) + squared(planetaEnY - tierraEnY));

	//Transformación lineal a rango de frecuencias
	freq = (((r-0.277)/(30.783))*(220-880)) + 880;

	freq.value;
};

// Generador de ondas
fork{
	var i;
	i = 0;
	loop{
		//Incremento de 401.8 días cada segundo cumple un periodo de Neptuno en +/- 2:30 min.
		i = i + 401.8;

		fMercurio = freqPlaneta.value(0.39, 87.96, i);
		fVenus = freqPlaneta.value(0.723, 224.68, i);
		fMarte = freqPlaneta.value(1.524, 686.98, i);
		fJupiter = freqPlaneta.value(5.203, 4332.71, i);
		fSaturno = freqPlaneta.value(9.539, 10759.1, i);
		fUrano = freqPlaneta.value(19.18, 30707.41, i);
		fNeptuno = freqPlaneta.value(30.06, 60198.5, i);
		fSol = 1;


		//Sol
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fSol,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Mercurio
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fMercurio,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Venus
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fVenus,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Marte
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fMarte,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Jupiter
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fJupiter,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Saturno
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fSaturno,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Urano
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fUrano,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};

		//Neptuno
		fork{
			play{
				Splay.ar({SinOsc.ar(
					fNeptuno,
					0,
					0.1)}
				!64)   *   LFGauss.ar(9,0.25,0,0,2)
			};
		};
		1.wait}
};