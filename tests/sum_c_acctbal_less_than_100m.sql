--sum(c_acctbal)<100m test
Select
    sum(c_acctbal) as total_acctbal

 FROM {{ ref('playing_with_tests')}}

 having  sum(c_acctbal)  < 100000000

 /*
 If there is rows coming from this statement, then test fail
 */