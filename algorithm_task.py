# 2023 KAKAO BLIND RECRUITMENT 이모티콘 할인행사
from itertools import product

def get_reduced_prices(n, emoticons, percent):
    discount_rate = [10, 20, 30, 40]

    # 모든 가능한 경우의 할인율 순열
    discount_sets = list(product(discount_rate, repeat = n))
    
    reduced_prices = []
    for discount_set in discount_sets:
        # 가격X할인율 계산, 한 사람이 가능한 살 수 있는 가격의 모든 경우의 수가 담긴 reduced_prices
        temp = []
        for i in range(n):
            calculated_price = emoticons[i] * (100-discount_set[i]) * 0.01
            if discount_set[i] >= percent:
                temp.append(int(calculated_price))
            else:
                temp.append(0)
        reduced_prices.append(temp)
    
    return reduced_prices

# users: [[40% 이상이면 다 사, 만원 이상이면 +구독], [25% 이상이면 다 사, 만원 이상이면 +구독]]
# emoticons: [7000원, 9000원] 
def solution(users, emoticons): 
    n = len(emoticons)
    
    all_reduced_prices = []
    # x% 이상이어서 살 예정인 임티 && 할인율까지 적용한 가격
    for i in range(len(users)):
        all_reduced_prices.append(get_reduced_prices(n, emoticons, users[i][0]))
    
    new = [] # all_reduced_prices 재정비: 기존의 사람 단위가 아닌, 할인율 세트 단위 기준의 리스트로 변경
    for i in range(len(all_reduced_prices[0])):
        new.append([])

    for reduced_prices_per_person in all_reduced_prices:
        for i in range(len(reduced_prices_per_person)):
            new[i].append(reduced_prices_per_person[i])  
    
    ans = []
    for percent_combi in new:
        subscribe = 0
        s = 0 # percent_combi에 있는 가격 세트의 sum
        for i in range(len(percent_combi)): # i는 사람수
            if sum(percent_combi[i]) >= users[i][1]: # 가격 합이 유저의 기준가격 이상이면
                subscribe += 1 # 이모티콘 구매를 모두 취소하고 이모티콘 플러스 서비스에 가입
            else:
                s += sum(percent_combi[i]) # 그냥 임티 구매
        ans.append([subscribe, s]) # [가입자수, 판매액]
    
    # 내림차순으로 정렬 
    ans.sort(key=lambda x: (x[0], x[1]), reverse = True)                
    

    return ans[0]
