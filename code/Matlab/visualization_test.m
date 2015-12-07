function rgb_Matrix = visualization_test( Map )

colormap = [    0.0,        0.0,            0.0 ;   %Black=1        <=> Speed==0
                1.0,        1.0,            0.0;    %Yellow=2       <=> Speed==1
                1.0,        165./255.,      0.0;    %orange=3       <=> Speed==2
                1.0,        69./255.,       0.0;    %orange red=4   <=> Speed==3
                1.,         0.0,            0.0;    %Red=5          <=> Speed==4
                128./255,   0.0,            0.0;    %Maroon=6       <=> Speed==5         
                1,          1,              1];     %White=7        <=> free_road

           
M_plot = Map + 1;


rgb_Matrix = image(ind2rgb(M_plot,colormap));


end

