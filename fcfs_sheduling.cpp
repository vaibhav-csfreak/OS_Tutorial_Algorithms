#include<bits/stdc++.h>
using namespace std;


vector<int> bt,ct,tat,wt,processed,at1;
vector<pair<int,int>> at;
int timer = 0;
queue<int> q;
int n;

void init(int n)
{
    bt.assign(n+1,0);
    ct.assign(n+1,0);tat.assign(n+1,0);
    wt.assign(n+1,0);processed.assign(n+1,0);
    at1.assign(n+1,0);
}

void cal()
{
    while(!q.empty())
    {
        int pid = q.front();
        q.pop();
        processed[pid]=1;
        ct[pid] = bt[pid]+timer;
        timer = ct[pid];
        tat[pid] = ct[pid]-at1[pid];
        wt[pid] = tat[pid]-bt[pid];
    }
}
void display()
{
    cout << "Process " << "AT\t" << "BT\t" << "CT\t" << "TAT\t" << "WT \n";
    for(int i=1;i<=n;i++)
    {
        cout << 'P' << i << "\t" << at1[i] << "\t" << bt[i] << "\t" <<ct[i] << "\t"<< tat[i] << "\t" << wt[i] << "\n";
    } 
}

int main()
{
   
    cout << "Enter number of processes\n";
    cin >> n;

    init(n);

    cout << "Enter arrival time of " << n << " processes\n";
    for(int i=1;i<=n;i++)
    {
        cin >> at1[i];
        at.push_back({at1[i],i});
    }
    sort(at.begin(),at.end());

    cout << "Enter burst time of " << n << " processes\n";
    for(int i=1;i<=n;i++)
    cin >> bt[i];

    // inserting processes in the queue which have arrived
    
    for(int i=0;i<n;i++)
    {
        int pid = at[i].second;
        if(at[i].first<=timer && processed[pid]==0)
        {
            q.push(pid);
        }
        cal();
    }

    //avg tat


    display();

    int tot=0;
    for(int i=1;i<=n;i++)
    {
        tot+=tat[i];
    }
    cout << "Average turnaround time is " << double(tot)/n << "\n";

    //avg wt
    tot=0;
    for(int i=1;i<=n;i++)
    {
        tot+=wt[i];
    }
    cout << "Average waiting time is " << double(tot)/n << "\n";


}
