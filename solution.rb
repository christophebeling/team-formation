# Enter your code here. Read input from STDIN. Print output to STDOUT
def build_group (team_member, team_hash, size)
    #puts "current: #{team_member}"
    #puts "pool before delete #{team_hash}"
    delete_member(team_member, team_hash)
    #puts "pool after delete #{team_hash}"
    if (team_hash[team_member+1] != nil && (team_hash[team_member] == nil || team_hash[team_member+1] > team_hash[team_member]))
        return build_group(team_member+1, team_hash, size+1)
    else
        return size
    end
end

def delete_member (member, pool)
    #puts "member:#{member} => #{pool[member]}"
    if(pool[member] != nil && pool[member] > 1)
        #puts "decrease member: #{member}"
        pool[member] -= 1
    elsif(pool[member] != nil)
        #puts "delete member: #{member}"
        pool.delete(member) 
    else
#puts pool[member] != nil
        fail("member #{member}  not found in pool #{pool}")
    end
end
        

STDIN.gets
STDIN.each_line do |line|
    if(line[0].to_i == 0)
        puts 0
        next
    end
    members = line.split(' ')[1..-1].map(&:to_i)
    members_hash = Hash.new
    members.each do |member|
        if(members_hash[member] != nil)
            members_hash[member] += 1
        else
            members_hash[member] = 1
        end
    end
    group_sizes = []   
    position = 0
    while (members_hash.length > 0)
        #puts "Start search with #{members_hash}"
        size = build_group members_hash.keys.min, members_hash, 1
        #puts "Team of #{size} found! Elements left #{members_hash}"
        group_sizes << size
    end
    #puts  "result: #{group_sizes.sort.first}"    
    if group_sizes.sort.first == nil
        puts 1
    else
        puts group_sizes.sort.first
    end
end    


        
        

    
