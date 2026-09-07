# Deployment Checklist

## Pre-Deployment
- [ ] All tests passed in latest build
- [ ] Code reviewed and approved
- [ ] Image tag identified (check GHCR)
- [ ] Rollback plan ready (know previous working version)

## During Deployment
- [ ] Execute deploy workflow
- [ ] Approve deployment (if required)
- [ ] Monitor health endpoint: `GET /health`
- [ ] Check production logs

## Post-Deployment
- [ ] Verify `/health` returns 200 OK
- [ ] Test core functionality
- [ ] Monitor error rates
- [ ] Confirm no alerts triggered

## Rollback Steps
1. Go to Actions → Rollback Production
2. Enter previous working image tag
3. Approve
4. Monitor health endpoint
5. Notify team

## Contacts
- On-call: [Your team contact]
- Slack: #deployments
- PagerDuty: [Link if applicable]
