---
title:  "AWS DNS Issues"
date:   2019-10-18 10:00:00 -0400
categories: aws
---

I use Amazon Web Services entirely to host the web site on [https://danschaffer.info](https://danschaffer.info).
I have owned the domain danschaffer.info for a while using the amazon domain registration.  A typical .info domain
costs about $12 per year.  I previously setup a hello world web page on danschaffer.info using a s3 bucket and
a route 53 hosted zone but a deleted the hosted zone.  When resurrecting the site using jekyll I created a new
Hosted zone.

Creating a Hosted zone Record Set for danschaffer.info. creates NS and SOA records.  The NS record stands for
name server and shows which DNS server is authoritative for the domain.  Some minor trivia is technically fully
qualified domain names end with a dot since there may be amibiguity (this dates back to 1987).  Generally now
the dot is removed although you could still use it in your browser.  When I created the record set 4 servers
were created with .com., .co.uk., .org., and .net.  The name servers are specific to amazon and are something like ns-111-awsdns-11.com.
I can see the values publicly on [intodns.com](https://intodns.com/danschaffer.info).

The SOA is the start of authority.  The SOA is important to hold the name of the primary DNS server for the zone.
I can see verify the SOA by browsing to [https://dnslookup.online/soa.html](https://dnslookup.online/soa.html) and entering danschaffer.info.

I ran into some confusion where for the domain registration I was not sure whether the 4 authoritative name
server records were correct for the hosted zone or domain registration.  Initially I modifed the domain registration
servers to match the new hosted zone.  I was unable to resolve danschaffer.info and thought I would just have
to wait 2 days until the TTL expired.  But then I got distracted so days turned into a week.  Then reading the
aws documentation I discovered the hosted zone contains the correct servers and changing the domain registration
immediately made the link resolve.

To actually create the web page I copy the jekyll output to my s3 bucket.  I created a cloudfront distribution
in front of the s3 bucket and a second cloudfront distribution to an s3 bucket to redirect to the other s3 bucket.
Then in route53 I created a A record for www.danschaffer.info and another A record for danschaffer.info.
Each A record points to the cloudfront distribution.  I could test each A record by running `nslookup danschaffer.info`
and `nslookup www.danschaffer.info`.

It was a good first step to get the jekyll site working under the danschaffer.info domain and better understand
how route53 works.  I thought the setup would be easier but anyways it's a victory to have the site working.
