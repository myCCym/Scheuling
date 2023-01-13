classdef job
 
    properties
        id;
        height;
        width;
        window;
        state;
        dictionary;
    end
    
    methods
        function job = job(T,D,S,id)
         job.id = id;
         job.width = randi(D);
         job.height = (0.9*S*rand+0.1)/job.width;
         % window size: 0-8
         job.dictionary = zeros(T, T);
         
         for i=1:T
             for j=1:T
                 if i>=j && i<j+job.width
                     job.dictionary(i, j)=job.height;
                 end
                  
             end
         end
         
         
         ta = randi(T- job.width);
         ts = ta+ randi(8);
         job.window = (ta: min(ts, T- job.width));
         job.state = 0;
      end
    end
    
end



