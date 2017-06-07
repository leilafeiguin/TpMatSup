pkg load control;
pkg load signal;

%Configuraciones de pantalla
x = get(0, 'ScreenSize')
ancho = 500
alto = 500
x = [x(3)/2-(ancho/2) x(4)/2-(alto/2) ancho alto]
pantalla = dialog ("name", "TP Matemática Superior", "resize", "off");
set(pantalla, "position", x);

%Controles de la UI
% 1) Dropdown de opciones, cuando se cambia la opcion llama a la funcion cambioSelect 
uicontrol(pantalla, "style", "text", ...
          "string","Ingresar por:", ...
          "position", [-200 alto - 47.5 ancho - 0 25]);
sOpciones = uicontrol(pantalla, "style", "popupmenu", ...
              "string","Coeficientes|Polos y Ceros", ...
              "position", [100 alto - 50 ancho - 110 25], ...
              "callback", {@cambioSelect, "1"});
              

               