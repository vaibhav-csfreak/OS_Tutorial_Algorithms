#include <bits/stdc++.h>
using namespace std;

int pageFault(int pages[],int n,int framesCount)
{
    queue<int> q;
    set<int> frame;
    int pageFault_count = 0;

    for(int i=0;i<n;i++)
    {
        int pageNo = pages[i];
        auto it = frame.find(pageNo);
        if(it==frame.end())
        {
            if(frame.size()>=framesCount)
            {
                 int replace = q.front();
                 q.pop();
                 frame.erase(replace);
            }
           
            frame.insert(pageNo);
            q.push(pageNo);
            pageFault_count++;
        }
    }
    return pageFault_count;

}

int main()
{
    int pages[] = {3,2,1,3,4,1,6,2,4,3,4,2,1,4,5,2,1,3,4};
    int n = sizeof(pages)/sizeof(pages[0]);
    
    int framesCount = 4;
    
    cout << pageFault(pages,n,framesCount) << "\n";
    return 0;
    
}
