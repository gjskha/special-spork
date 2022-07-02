import functools

def get_min_days(dist_centers):
    
    total_inventory = functools.reduce(lambda a,b: a+b, dist_centers)
    days = 0
    #print(dist_centers)
    while total_inventory > 0:

        tmp = []
        # some number bigger than any inventory expected
        minimum_inventory = float('inf')

        for dist_center in dist_centers:
            if dist_center > 0 and dist_center < minimum_inventory:
                minimum_inventory = dist_center
    
        for dist_center in dist_centers:
            if dist_center > 0:
                tmp.append(dist_center - minimum_inventory)
            else:
                tmp.append(0)
        
        dist_centers = tmp
        total_inventory = functools.reduce(lambda a,b: a+b, dist_centers)
        days += 1
    
    print("days is ",days)

get_min_days([1,2,3])
get_min_days([2,3])
get_min_days([5,10,15])
get_min_days([5,3,15])
