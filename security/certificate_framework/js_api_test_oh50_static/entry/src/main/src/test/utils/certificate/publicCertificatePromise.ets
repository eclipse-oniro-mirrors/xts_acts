/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


let certUft8WithChineseSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDgTCCAmmgAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFcxCzAJBgNVBAYT\n' +
  'AkNOMQ8wDQYDVQQIDAbpmZXopb8xDzANBgNVBAcMBuilv+WuiTEPMA0GA1UECgwG\n' +
  '5rWL6K+VMRUwEwYDVQQDDAzkuK3mlofmtYvor5UwHhcNMjQwNTEzMDgwMjQ3WhcN\n' +
  'MzQwNTExMDgwMjQ3WjBXMQswCQYDVQQGEwJDTjEPMA0GA1UECAwG6ZmV6KW/MQ8w\n' +
  'DQYDVQQHDAbopb/lrokxDzANBgNVBAoMBua1i+ivlTEVMBMGA1UEAwwM5Lit5paH\n' +
  '5rWL6K+VMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArPh1a1JvzN/X\n' +
  'rg/R4SlGiPIQjDpQr9QYPS3ZFjYWUt4HGVKYqW1TDLuN+9yePfxH5OQnu9NGQo1d\n' +
  'sMkri+mq3Vus/UDl/5hRoFhbyRxuc0SlKTBsJN1VAjb2RydfGvwM11NbbOu8w+M5\n' +
  'Ox5Ht6aSCpTOyWp7QWgqmGWXQ0mWTGyLpLmOkvVU1RgcLuwRK9QqbcgfjpbW2c+E\n' +
  'W+eC2p1YeHISkUN0bk/+uHC2NYR/jFnvgkbQk9zi6G2vt1OJOjKbX0BIUaKfLuyr\n' +
  'LINHKQ1VUu+dDx6PEby/zCKRGUdGasJlWEc+94DTPTAN7OyhAowqpY1lQ8cpesqt\n' +
  'ktP6IrPAGwIDAQABo1MwUTAdBgNVHQ4EFgQU4HkPdkcjPWQM93FYM6leQi5lFKww\n' +
  'HwYDVR0jBBgwFoAU4HkPdkcjPWQM93FYM6leQi5lFKwwDwYDVR0TAQH/BAUwAwEB\n' +
  '/zANBgkqhkiG9w0BAQsFAAOCAQEALD4CetOC79QD2AE4DGWQ6j66FZLU4YkQ44lm\n' +
  '1iG0QAtXnnpaan7CN5hCQ3rQhb4jaCauYNqH/iSvym6MqvJ+KJr06luWI0+uThnD\n' +
  'zg+1AMn9Jn+wC95p5+ZstAtwmfHQNYlL++hXQDZspS3JOZDUNSx6HZFhDsyM0Lnk\n' +
  'muO0rwJxeWxPglj1II+JjkXhuji0Pac4jjXamBlKZYMbM16+zGBnORhwWS+hQ7Eu\n' +
  'S2QBpKut3kF/lc8htOApzKEvThTtHsaYp410q4ego7+k3Kbk4a8VpzdQMMipO/Fk\n' +
  'BwOKEuuyb6pLN0btEwGqaZRK2BbbSUX39+06Z/OPbujL8X3/SA==\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithNullSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIBzjCCATegAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMAAwHhcNMjQwNTE1\n' +
  'MDkzMTQ1WhcNMzQwNTEzMDkzMTQ1WjAAMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB\n' +
  'iQKBgQCyXbtKPbpKIvQSqFIKThMBHdPkquDJ/Lg8+PDbwP3s+AJ1b6fFhsB9s0oV\n' +
  'knmmYT1CYvN52RVYTJJDPFbEFsbBePQLG/OAaMKDg6SXieVgzbvx5MStJaBDvhqT\n' +
  'GwdzmxKfadghxdOfT65E4KENUipc2WI0/H2BqvwkXahIugBhJQIDAQABo1MwUTAd\n' +
  'BgNVHQ4EFgQUuMkml7Jx2h2A1dEuGt+SLUt2UV8wHwYDVR0jBBgwFoAUuMkml7Jx\n' +
  '2h2A1dEuGt+SLUt2UV8wDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOB\n' +
  'gQAFSN+j8N5bORIt79WaM8rSgtKJspxagkyrQxbX6zerhYy1Jdakp/gk0mzjBllD\n' +
  'LS1tc0elUH9uBeGMNe0EHaFmIW+9ZyBHNSgC5kFO+c9foM5IlgX2rffgoyYhymzg\n' +
  'QjEAdY2Ni2kz9CUvUj8sy/vGtdOXkBFBpGrNUEKz4STKjA==\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithSpecialSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDizCCAnOgAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFwxCzAJBgNVBAYT\n' +
  'AkNOMQ8wDQYDVQQIDAbpmZXopb8xEjAQBgNVBAcMCeilv++/peWuiTEQMA4GA1UE\n' +
  'CgwH5rWLJeivlTEWMBQGA1UEAwwN5Lit5paHQOa1i+ivlTAeFw0yNDA1MTUwOTQx\n' +
  'NTFaFw0zNDA1MTMwOTQxNTFaMFwxCzAJBgNVBAYTAkNOMQ8wDQYDVQQIDAbpmZXo\n' +
  'pb8xEjAQBgNVBAcMCeilv++/peWuiTEQMA4GA1UECgwH5rWLJeivlTEWMBQGA1UE\n' +
  'AwwN5Lit5paHQOa1i+ivlTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n' +
  'ANE1XpjR6Zrk2eJ6e9arl3S3KEQFNidC4wANm2uTAhRKWk9u3GQhyaMtJ44TCv7J\n' +
  'yG4j5Vn5dXHPELYhKrTUoG2vK7qYigDi2xh3VEQcc9yQGa/BMT2j2xoye62OXd4u\n' +
  '3SRKK7suAyBNFuYcOCe7bKaiWoQJJI3+EQjwWVUVcXLdW+spS4DvBA0ZATsZmrs+\n' +
  '4pw1q5U68pm5Fy0n14lCQohK1SdiaccAHK129bK5B5KHYuJZ9/jfJZn2zIv8qHV2\n' +
  '8NNccqBQS36rVGWfRkfSlHscfDhQ4ZxEhInayfu5BY0qxqLLFOtqeQGvmTTjGW/n\n' +
  'L2s47mL0/uWnpFlMJ7BxHoECAwEAAaNTMFEwHQYDVR0OBBYEFKsCCrUUhKQDw4Rl\n' +
  'ndlKCRybnupnMB8GA1UdIwQYMBaAFKsCCrUUhKQDw4RlndlKCRybnupnMA8GA1Ud\n' +
  'EwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBACS1dPSJzMpoZaMohs7Kk0zE\n' +
  'e7Mv+iZElwDi3vfG11CynbOleIFEFGeixRTQyVW5SMmZGMdwaF3uD3Uoas7Q9G8d\n' +
  'NKZsJa0FeFg5aArBBr7ggbVTR5iEDs32cPr9ic/VDNBGqIcQmp10qvZ0cydK10Fl\n' +
  'g/0YJB1pw7zZwz+J5YgTKwkTAbtFLva6yqPno8HG+FruMXF3WxGAsLfIOjL9h7rU\n' +
  'jG5iRiA0WjdrKW4YTNNzjoez3SFx7/P7NWg1gp51HwBSL7mg+ctVjsG9G4xwhrLI\n' +
  'dcJFeuBWEaWbA6lAiW+lAcQKqqfolHOF7VMIB+ieIUR0cavlHEIGLYg/BL5VSKU=\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIBHTCBwwICA+gwCgYIKoZIzj0EAwIwGjEYMBYGA1UEAwwPRXhhbXBsZSBSb290\n' +
  'IENBMB4XDTIzMDkwNTAyNDgyMloXDTI2MDUzMTAyNDgyMlowGjEYMBYGA1UEAwwP\n' +
  'RXhhbXBsZSBSb290IENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEHjG74yMI\n' +
  'ueO7z3T+dyuEIrhxTg2fqgeNB3SGfsIXlsiUfLTatUsU0i/sePnrKglj2H8Abbx9\n' +
  'PK0tsW/VgqwDIDAKBggqhkjOPQQDAgNJADBGAiEApVZno/Z7WyDc/muRN1y57uaY\n' +
  'Mjrgnvp/AMdE8qmFiDwCIQCrIYdHVO1awaPgcdALZY+uLQi6mEs/oMJLUcmaag3E\n' +
  'Qw==\n' +
  '-----END CERTIFICATE-----\n';


export {
  certUft8WithChineseSubject,
  certUft8WithSpecialSubject,
  certUft8WithNullSubject,
  certUft8WithSubject,
};