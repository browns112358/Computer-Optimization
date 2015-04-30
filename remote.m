function remoteness =remote(Data)
%Function to find remoteness from Lat, Long, and Pop data
Lat=Data(:,9); %Pull Data
Long=Data(:, 10);
Pop=Data(:, 4);
remoteness=[];
for i=1:length(Lat)
   Distance=Pop./(sqrt(  (Lat-Lat(i)).^2 + (Long-Long(i)).^2   )  );
   Distance(isinf(Distance))=0;
   remoteness(i)=sum(Distance);
end

remoteness=remoteness./max(remoteness);

end
