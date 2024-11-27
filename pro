********bankers algorithm**************
#include <stdio.h>

int main() {
    int n, frames;
    printf("Enter the number of pages: ");
    scanf("%d", &n);
    int pages[n];
    printf("Enter the page reference string: ");
    for (int i = 0; i < n; i++) 
	{
        scanf("%d", &pages[i]);
    }
    printf("Enter the number of frames: ");
    scanf("%d", &frames);
    int frame[frames];
    int index = 0;  // Pointer for the FIFO queue
    int pageFaults = 0;
	for (int i = 0; i < frames; i++) {
        frame[i] = -1;
    }
    printf("Page Reference String | Frames\n");
    printf("-----------------------------\n");
    for (int i = 0; i < n; i++) 
	{
        int page = pages[i];
        int found = 0;
        for (int j = 0; j < frames; j++) 
		{
            if (frame[j] == page) {
                found = 1;
                break;
            }
        }
        if (!found) 
		{
            frame[index] = page;
            index = (index + 1) % frames; // Move to the next frame in a circular manner
            pageFaults++;
        }
        printf("%d\t\t\t", page);
        for (int j = 0; j < frames; j++) {
            if (frame[j] != -1)
                printf("%d ", frame[j]);
            else
                printf("- ");
        }
        printf("\n");
    }
    printf("-----------------------------\n");
    printf("Total Page Faults: %d\n", pageFaults);
    return 0;
}


************CPU cheduling***************
#include<stdio.h>
int main()
{
	int n;
	printf("enter the no of processor = ");
	scanf("%d",&n);
	int at[n],bt[n],wt[n];
	float avg1=0,avg2=0;
	for(int i=0;i<n;i++)
	{
		printf("Enter the Arivale time: %d = ",i+1 );
		scanf("%d",&at[i]);
	}
	for(int j=0;j<n;j++)
	{
		printf("Enter the Brust time : %d = ",j+1);
		scanf("%d",&bt[j]);
	}
	for(int i=0;i<n;i++)
	{
		if(i==0)
		{
			wt[i]=at[0];
		}
		else
		{
			wt[i]=wt[i-1]+bt[i-1];
		}
		avg1=wt[i];
		avg2=wt[i]+bt[i];
	}
	printf("\np\tat\tbt\twt\ttat");
	for(int i=0;i<n;i++)
	{
		printf("\np%d\t%d\t%d\t%d\t%d",i+1,at[i],bt[i],wt[i],wt[i]+bt[i]);
	}
	printf("\naverage waiting time %f",avg1);
	printf("\naverage turn around time %f",avg2);
	return 0;
}



*************page replacment***************
#include <stdio.h>

int main() {
    int n, frames;
    printf("Enter the number of pages: ");
    scanf("%d", &n);
    int pages[n];
    printf("Enter the page reference string: ");
    for (int i = 0; i < n; i++) 
	{
        scanf("%d", &pages[i]);
    }
    printf("Enter the number of frames: ");
    scanf("%d", &frames);
    int frame[frames];
    int index = 0;  // Pointer for the FIFO queue
    int pageFaults = 0;
	for (int i = 0; i < frames; i++) {
        frame[i] = -1;
    }
    printf("Page Reference String | Frames\n");
    printf("-----------------------------\n");
    for (int i = 0; i < n; i++) 
	{
        int page = pages[i];
        int found = 0;
        for (int j = 0; j < frames; j++) 
		{
            if (frame[j] == page) {
                found = 1;
                break;
            }
        }
        if (!found) 
		{
            frame[index] = page;
            index = (index + 1) % frames; // Move to the next frame in a circular manner
            pageFaults++;
        }
        printf("%d\t\t\t", page);
        for (int j = 0; j < frames; j++) {
            if (frame[j] != -1)
                printf("%d ", frame[j]);
            else
                printf("- ");
        }
        printf("\n");
    }
    printf("-----------------------------\n");
    printf("Total Page Faults: %d\n", pageFaults);
    return 0;
}


********************disk scheduling*****************
#include <stdio.h> 
#include <stdlib.h> 
int main() { 
    int n, head, seek_time = 0; 
    printf("Enter the number of disk requests: "); 
    scanf("%d", &n); 
    int request_queue[n]; 
    printf("Enter the disk request queue:\n"); 
	for (int i = 0; i < n; i++) { 
        scanf("%d", &request_queue[i]); 
    } 
    printf("Enter the initial position of the disk head: "); 
    scanf("%d", &head); 
    printf("\nFCFS Disk Scheduling:\n"); 
    printf("Head Movement Sequence: %d", head);
    for (int i = 0; i < n; i++) { 
        seek_time += abs(head - request_queue[i]);
		head = request_queue[i]; 
        printf(" -> %d", head); 
    } 
    printf("\nTotal Seek Time: %d\n", seek_time); 
	printf("Average Seek Time: %.2f\n", float (seek_time / n)); 
    return 0; 
}


********unix***********
#include<stdio.h> 
#include<fcntl.h> 
#include<errno.h> 
extern int errno; int 
main() 
{ 
} 
int fd = open("foo.txt", O_RDONLY | O_CREAT); 
printf("fd = %d\n", fd); 
if (fd ==-1) 
{ 
printf("Error Number % d\n", errno); 
perror("Program"); 
} 
return 0;



*********Virtualmemory*************

#include <stdio.h>

#define MAX_BLOCKS 10
#define MAX_PROCESSES 10

void bestFit(int blockSizes[], int numBlocks, int processSizes[], int numProcesses) {
    int allocation[MAX_PROCESSES];
    
    // Initialize all allocations to -1 (unallocated)
    for (int i = 0; i < numProcesses; i++) {
        allocation[i] = -1;
    }
    
    // Allocate memory for each process
    for (int i = 0; i < numProcesses; i++) {
        int bestIdx = -1;
        for (int j = 0; j < numBlocks; j++) {
            // Check if block can fit the process and if it's the smallest suitable block
            if (blockSizes[j] >= processSizes[i]) {
                if (bestIdx == -1 || blockSizes[j] < blockSizes[bestIdx]) {
                    bestIdx = j;
                }
            }
        }
        
        // If a suitable block was found, allocate it
        if (bestIdx != -1) {
            allocation[i] = bestIdx;
            blockSizes[bestIdx] -= processSizes[i]; // Reduce available size of the block
        }
    }
    
    // Output the allocation result
    printf("\nProcess No.\tProcess Size\tBlock No.\n");
    for (int i = 0; i < numProcesses; i++) {
        printf("%d\t\t%d\t\t", i + 1, processSizes[i]);
        if (allocation[i] != -1) {
            printf("%d\n", allocation[i] + 1);
        } else {
            printf("Not Allocated\n");
        }
    }
}

int main() {
    int blockSizes[MAX_BLOCKS], processSizes[MAX_PROCESSES];
    int numBlocks, numProcesses;

    // Input the number of memory blocks
    printf("Enter the number of memory blocks: ");
    scanf("%d", &numBlocks);
    printf("Enter the sizes of the memory blocks:\n");
    for (int i = 0; i < numBlocks; i++) {
        printf("Block %d: ", i + 1);
        scanf("%d", &blockSizes[i]);
    }

    // Input the number of processes
    printf("\nEnter the number of processes: ");
    scanf("%d", &numProcesses);
    printf("Enter the sizes of the processes:\n");
    for (int i = 0; i < numProcesses; i++) {
        printf("Process %d: ", i + 1);
        scanf("%d", &processSizes[i]);
    }

    // Call the Best Fit allocation function
    bestFit(blockSizes, numBlocks, processSizes, numProcesses);

    return 0;
}
