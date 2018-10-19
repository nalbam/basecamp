# Nexus

## api

```bash
cat <<EOF > developer.json
{
  "name": "developer",
  "content": "security.addUser('developer', 'Developer', 'User', 'developer@example.org', true, '', ['nx-anonymous','nx-admin'])",
  "type": "groovy"
}
EOF

curl -u admin:admin123 -X POST --header 'Content-Type: application/json' -d @developer.json http://nexus.apps.nalbam.com/service/rest/v1/script

curl -u admin:admin123 -X GET http://nexus.apps.nalbam.com/service/rest/v1/script

curl -u admin:admin123 -X POST --header 'Content-Type: text/plain' http://nexus.apps.nalbam.com/service/rest/v1/script/developer/run
```

* <https://help.sonatype.com/repomanager3/rest-and-integration-api/script-api>

## proxy

```text
maven-proxy
https://repo1.maven.org/maven2

maven-spring-release
https://repo.spring.io/release/

maven-spring-milestone
https://repo.spring.io/milestone/

npm-proxy
https://registry.npmjs.org/
```

* <https://help.sonatype.com/repomanager3/quick-start-guide-proxying-maven-and-npm>
