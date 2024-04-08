function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
    if n%2==0
        if NewDataValue>A(n/2+1)
            newMedian=A(n/2 +1);
        elseif NewDataValue>A(n/2) && NewDataValue<A(n/2+1)
            newMedian=NewDataValue;
        else
            newMedian=A(n/2);
        end
    else
        if NewDataValue>A(int32(n/2)+2)
            newMedian=0.5*(oldMedian+A(int32(n/2)+2));
        elseif NewDataValue>oldMedian&& NewDataValue<A(int32(n/2)+2)
            newMedian=0.5*(oldMedian+NewDataValue);
        elseif NewDataValue<oldMedian && NewDataValue>A(int32(n/2))
            newMedian=0.5*(oldMedian+NewDataValue);
        elseif NewDataValue<int32(A(n/2))
            newMedian=0.5*(oldMedian+int32(A(n/2)));
        end
    end
end
