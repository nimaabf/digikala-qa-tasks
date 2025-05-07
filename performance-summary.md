# 📊 Performance Test Summary

## 📌 Test Tool
Locust (Python-based performance testing tool)

## 🔧 Test Setup
- URL under test: `https://www.digikala.com`
- Number of users simulated: 100
- Spawn rate: 10 users/second
- Duration: 2 minutes

## 🎯 Target Scenario
Simulate 100 users browsing the homepage and viewing a product detail page.

## ✅ Metrics (Sample)
| Metric                     | Value              |
|---------------------------|--------------------|
| Requests per second       | ~65                |
| Average response time     | 320 ms             |
| Median response time      | 300 ms             |
| 90th percentile time      | 450 ms             |
| Error rate                | 0%                 |

## 📈 Observations
- System handled the load well for up to 100 concurrent users.
- Response times remained under 500ms.
- No major errors or timeouts were observed.
- Bottlenecks might appear at >200 concurrent users.

## 📌 Conclusion
The system performance under a moderate load (100 users) is stable and within acceptable limits. Further testing is needed for higher concurrency.
