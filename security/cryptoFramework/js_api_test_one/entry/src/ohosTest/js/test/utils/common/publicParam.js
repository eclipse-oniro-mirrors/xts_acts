/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

var deviceTestCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIEQDCCAyigAwIBAgIQICAIMRlDU0ytSEUfNeOUJTANBgkqhkiG9w0BAQsFADBcMQswCQYDVQQG\n" +
  "OAYDVQQDDDFIVUFXRUlfSFdKQURfODE4ZjhjNDUtOGNmNC00ZTM2LTkxOTMtNTQ5OWMwNzM0YzM4\n" +
  "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArZcfL6ot4z6k3T4X3C26EI557Zvrx9Ci\n" +
  "hNx6RMy+vjXa3E4BkxwZ3r0ADbc+msJOq0IyQJNujaLq35oQvJgMIvBn1xFurBXdOzbygc7G9GKt\n" +
  "sb4rmKUP0QEPHM2/TrxAJT2LNPLrOE047ESe2X76FpDY6oZdsoGJ5I9m/mlfGsxR1l1TeUjwA/Rs\n" +
  "UtISR66aastBy2tU7IubP0B0Gceqy9DnjTQtY9OpkOql08H20C30iCVijK6BmP43X4OMz2MS0leV\n" +
  "K0AHmhiv6ufu166Xtc2JOXRk/MJ+53iprvVEUowKY/ZATUz6iDHDZYM3MdQV+VbFrOevUceOSweY\n" +
  "PaXCzwIDAQABo4HqMIHnMB8GA1UdIwQYMBaAFDXT2UhPcFFNI7Ey1dXdJSHOBS7dMB0GA1UdDgQW\n" +
  "BBSndBqCYYcTB1kMNhYMM4r/vDLteTARBglghkgBhvhCAQEEBAMCBsAwCwYDVR0PBAQDAgTwMGYG\n" +
  "A1UdHwRfMF0wW6BZoFeGVWh0dHA6Ly9jcGtpLWNhd2ViLmh1YXdlaS5jb20vY3BraS9zZXJ2bGV0\n" +
  "L2NybEZpbGVEb3duLmNybD9jZXJ0eXBlPTQmeWVhcj0vY3JsMjAyMC5jcmwwHQYDVR0lBBYwFAYI\n" +
  "KwYBBQUHAwEGCCsGAQUFBwMCMA0GCSqGSIb3DQEBCwUAA4IBAQCNTqZHRy7BJ+KFOflqwYkeD1Yd\n" +
  "K5XxcZUykw8AefX3SMYzSBzy7IIIhM5bvhWF6r5NnBJYqmyQfy+3K0Z0LQXfsY95U9JBkKl3nQPn\n" +
  "p1PzV8wLp/XYE7ePsbIbjQ1gQdC47sTDjoA73X4wEchdEVJBNUs2e15HRxbzaVJ6ABSKI9AHkxKv\n" +
  "o9iYKFozQaL4y+3Y+Yei/N1kiZZayJqC1uXq45kelc3SCJrVPE4g/Uspf2jjp7xsS+MkmxvSAT9X\n" +
  "OJeDWEeXyt7tvJeodRQgGZVhdtN78mtoaqWqD9Z6a6wpWdC4sZCWJfMjCu4Wd889Pn4MT5DBKBN3\n" +
  "f3+JpOzUJlM9\n" +
  "-----END CERTIFICATE-----\n";

var rootCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "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\n" +
  "jI6AaoTlr5I7zPhFbR8/XEs7DzI=\n" +
  "-----END CERTIFICATE-----\n";

var chainFirstCaCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "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\n" +
  "-----END CERTIFICATE-----\n";

var chainSecondCaCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "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\n" +
  "-----END CERTIFICATE-----\n";

var testInvalidCert =
  "-----xxxx CERTIFICATE-----\n" +
  "MIIDpzCCAo+gAwIBAgICAQAwDQYJKoZIhvcNAQELBQAwbDELMAkGA1UEBhMCQ04x\n" +
  "CzAJBgNVBAgMAkJKMQswCQYDVQQHDAJCSjELMAkGA1UECgwCSEQxDDAKBgNVBAsM\n" +
  "A2RldjELMAkGA1UEAwwCY2ExGzAZBgkqhkiG9w0BCQEWDGNhQHdvcmxkLmNvbTAe\n" +
  "Fw0yMjA4MTkwNTE2MTVaFw0yMzA4MTkwNTE2MTVaMGwxCzAJBgNVBAYTAkNOMQsw\n" +
  "CQYDVQQIDAJCSjELMAkGA1UEBwwCQkoxCzAJBgNVBAoMAkhEMQwwCgYDVQQLDANk\n" +
  "ZXYxCzAJBgNVBAMMAmNhMRswGQYJKoZIhvcNAQkBFgxjYUB3b3JsZC5jb20wggEi\n" +
  "MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCuvLoVT5em7ApBma8xtgpcFcaU\n" +
  "CbXBJSUl2NpFW2sriucbEOvKRdw9KvLa/tSP6CupPZVKIzHAP2oeW88aFBr23miG\n" +
  "iR49M52c73Iw3H3EG2ckK8M1mxEzXSqynivqiNZDKG+bA5cFzcfmk6Th1bJan9w9\n" +
  "Ci8HPSBvgg7Rc6pqNM4HjTHl3Bb6cf4Xh3/GgpjypTd9jAAEyq+l/+1pnTYVlIJA\n" +
  "WGh0Z26RosXfzwfFKH77ysTjoj9ambvGmFsMXvNXEyYmBCeYND6xGj4pa2lylsra\n" +
  "kfYmGxcFQ45Lj5oWdNQQVdvrQiYWu3SJOC/WqB5UIAq92PPrq1apznxfjqABAgMB\n" +
  "AAGjUzBRMB0GA1UdDgQWBBRI5iWwjBMAOCcgcUjUCYJdsvwEMjAfBgNVHSMEGDAW\n" +
  "gBRI5iWwjBMAOCcgcUjUCYJdsvwEMjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3\n" +
  "DQEBCwUAA4IBAQABop7EJgS2czHKWVzdEwjbi9m5ZUPy6aOV9paV1e/5IyFNHwun\n" +
  "B64iwcg03+FmIWNuynb1mglHHrUoXygXu9GIR8cWfOI3W+Pnn8fDi8MxQMn/e/Jj\n" +
  "BuGcnRwKynRhyLdkyWYn1YwqenMuFJu9yzkhfAPltGFEuPYCWDatdhm6zhFdu1PE\n" +
  "EMErHpQOT45z5cgC4XqgKlE+n8L4/5RfZnbuUJ3bV+FuI+VApLGXJQlJQAOTqBDg\n" +
  "k7DMSgPUUxYYa6AGMFy6vqQ6hcgCMK08ko8LdjVd1MobKzM9Oh480GFZA/ubR3QW\n" +
  "lv3OuOhmnIxNGcPUiqpSiWKqR5tf1KUImIR9\n" +
  "-----END CERTIFICATE-----\n";

/*selfSignedCaCertSource
 * Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 272 (0x110)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = CN, ST = BJ, L = BJ, O = HD, OU = dev, CN = ca, emailAddress = ca@cryptoframework.com
        Validity
            Not Before: Aug 19 12:49:06 2022 GMT
            Not After : Aug 16 12:49:06 2032 GMT
        Subject: C = CN, ST = BJ, L = BJ, O = HD, OU = dev, CN = ca, emailAddress = ca@cryptoframework.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:9f:29:d0:85:84:ed:6c:30:6e:d0:13:83:e0:1b:
                    61:08:f7:dd:63:41:06:4b:54:fb:f0:15:7f:e4:e5:
                    d5:a0:1a:e1:33:9e:5b:6f:d9:01:17:38:b1:dc:0b:
                    55:3c:5d:5c:28:a9:16:c7:ae:88:63:77:d2:1c:17:
                    ad:71:54:1e:b7:0c:7f:4c:36:b0:29:33:9c:95:59:
                    fe:b4:1c:7c:43:b9:29:bd:6f:07:3e:83:10:47:20:
                    21:26:04:86:1a:8e:05:f6:01:8a:de:6a:7e:9a:b9:
                    47:6f:b6:47:f4:e1:ff:26:d5:fa:40:6b:52:5f:86:
                    b2:c5:db:0c:07:ba:a1:90:b2:e7:a9:46:a6:10:ef:
                    98:73:14:3b:b6:b5:de:3f:92:16:64:e1:31:b2:36:
                    c9:ec:ae:6b:52:da:81:2a:1a:04:97:d8:d4:9f:a2:
                    ee:35:8f:9a:61:05:47:47:50:da:9d:04:1a:31:d3:
                    81:01:a1:46:8e:55:bb:00:c7:8a:93:52:bf:45:cf:
                    f0:e5:00:fc:f6:1b:2f:f4:81:8f:51:6a:e0:2d:e0:
                    b5:fb:e3:7a:cc:14:6f:35:5a:32:8a:bf:c0:2b:b2:
                    d6:a7:17:23:cd:19:2d:ed:f0:85:1d:b8:73:47:17:
                    60:53:b4:b8:68:bd:7a:03:e9:db:87:f0:ef:26:06:
                    aa:01
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                8C:A3:3B:42:63:01:B3:4D:51:F6:E4:2D:B5:83:7F:18:39:2F:B7:B5
            X509v3 Authority Key Identifier:
                keyid:8C:A3:3B:42:63:01:B3:4D:51:F6:E4:2D:B5:83:7F:18:39:2F:B7:B5

            X509v3 Basic Constraints: critical
                CA:TRUE, pathlen:2
            X509v3 Key Usage:
                Certificate Sign, CRL Sign
            X509v3 Extended Key Usage:
                TLS Web Server Authentication, TLS Web Client Authentication
            X509v3 Subject Alternative Name:
                email:ca@cryptoframework.com
            X509v3 Issuer Alternative Name:
                email:ca@cryptoframework.com
    Signature Algorithm: sha256WithRSAEncryption
         87:ee:11:13:a7:09:eb:6f:e0:2d:8b:2c:2e:47:3b:11:28:3b:
         7b:12:b0:66:59:a2:b0:7c:81:89:cb:b2:ff:e5:da:80:e6:77:
         71:36:e0:40:d5:e5:42:86:4a:6f:0f:e4:b3:f0:7f:70:89:db:
         40:66:1b:a4:09:b8:ed:2b:9d:a3:e2:3f:1b:dc:63:d1:7e:e0:
         40:1f:70:b5:2a:db:4a:d3:ac:e9:28:e7:2e:26:14:d3:11:5c:
         16:c7:34:8f:a9:36:4a:b9:72:8b:04:50:72:34:b8:3c:e2:a2:
         51:2d:02:9b:71:77:0c:71:9d:8f:9e:4f:94:19:17:c6:e7:57:
         0a:ad:95:dc:9d:d5:c0:a7:f6:6d:58:d0:6f:3c:f6:f8:cf:d0:
         d6:6f:8f:ec:58:41:f8:99:9e:3b:c7:9e:9a:4a:8c:43:4b:45:
         31:4d:c4:33:8e:35:36:97:a3:0b:98:85:54:01:a0:a3:09:c2:
         f1:2d:01:f9:fc:47:f5:d0:49:b8:73:3a:be:9c:44:5b:0d:dc:
         91:91:43:65:0d:64:77:dd:58:46:0a:fb:8d:8f:1f:73:4b:ff:
         4f:4b:73:1d:66:ce:11:5c:e4:94:42:01:58:bd:66:a2:6a:4b:
         04:2c:1e:d3:f1:b0:f8:13:ba:d1:b7:e2:d8:ca:09:c3:cb:76:
         21:c0:75:43
 * */

var selfSignedCaCertPem =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIEMjCCAxqgAwIBAgICARAwDQYJKoZIhvcNAQELBQAwdjELMAkGA1UEBhMCQ04x\n" +
  "CzAJBgNVBAgMAkJKMQswCQYDVQQHDAJCSjELMAkGA1UECgwCSEQxDDAKBgNVBAsM\n" +
  "A2RldjELMAkGA1UEAwwCY2ExJTAjBgkqhkiG9w0BCQEWFmNhQGNyeXB0b2ZyYW1l\n" +
  "d29yay5jb20wHhcNMjIwODE5MTI0OTA2WhcNMzIwODE2MTI0OTA2WjB2MQswCQYD\n" +
  "VQQGEwJDTjELMAkGA1UECAwCQkoxCzAJBgNVBAcMAkJKMQswCQYDVQQKDAJIRDEM\n" +
  "MAoGA1UECwwDZGV2MQswCQYDVQQDDAJjYTElMCMGCSqGSIb3DQEJARYWY2FAY3J5\n" +
  "cHRvZnJhbWV3b3JrLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n" +
  "AJ8p0IWE7WwwbtATg+AbYQj33WNBBktU+/AVf+Tl1aAa4TOeW2/ZARc4sdwLVTxd\n" +
  "XCipFseuiGN30hwXrXFUHrcMf0w2sCkznJVZ/rQcfEO5Kb1vBz6DEEcgISYEhhqO\n" +
  "BfYBit5qfpq5R2+2R/Th/ybV+kBrUl+GssXbDAe6oZCy56lGphDvmHMUO7a13j+S\n" +
  "FmThMbI2yeyua1LagSoaBJfY1J+i7jWPmmEFR0dQ2p0EGjHTgQGhRo5VuwDHipNS\n" +
  "v0XP8OUA/PYbL/SBj1Fq4C3gtfvjeswUbzVaMoq/wCuy1qcXI80ZLe3whR24c0cX\n" +
  "YFO0uGi9egPp24fw7yYGqgECAwEAAaOByTCBxjAdBgNVHQ4EFgQUjKM7QmMBs01R\n" +
  "9uQttYN/GDkvt7UwHwYDVR0jBBgwFoAUjKM7QmMBs01R9uQttYN/GDkvt7UwEgYD\n" +
  "VR0TAQH/BAgwBgEB/wIBAjALBgNVHQ8EBAMCAQYwHQYDVR0lBBYwFAYIKwYBBQUH\n" +
  "AwEGCCsGAQUFBwMCMCEGA1UdEQQaMBiBFmNhQGNyeXB0b2ZyYW1ld29yay5jb20w\n" +
  "IQYDVR0SBBowGIEWY2FAY3J5cHRvZnJhbWV3b3JrLmNvbTANBgkqhkiG9w0BAQsF\n" +
  "AAOCAQEAh+4RE6cJ62/gLYssLkc7ESg7exKwZlmisHyBicuy/+XagOZ3cTbgQNXl\n" +
  "QoZKbw/ks/B/cInbQGYbpAm47Sudo+I/G9xj0X7gQB9wtSrbStOs6SjnLiYU0xFc\n" +
  "Fsc0j6k2SrlyiwRQcjS4POKiUS0Cm3F3DHGdj55PlBkXxudXCq2V3J3VwKf2bVjQ\n" +
  "bzz2+M/Q1m+P7FhB+JmeO8eemkqMQ0tFMU3EM441NpejC5iFVAGgownC8S0B+fxH\n" +
  "9dBJuHM6vpxEWw3ckZFDZQ1kd91YRgr7jY8fc0v/T0tzHWbOEVzklEIBWL1mompL\n" +
  "BCwe0/Gw+BO60bfi2MoJw8t2IcB1Qw==\n" +
  "-----END CERTIFICATE-----\n";

var selfSignedCaCertDer =
  "308204323082031aa00302010202020110300d06092a864886f70d" +
  "01010b05003076310b300906035504061302434e310b300906035504080c02424a310b30090603550" +
  "4070c02424a310b3009060355040a0c024844310c300a060355040b0c03646576310b300906035504" +
  "030c0263613125302306092a864886f70d010901161663614063727970746f6672616d65776f726b2" +
  "e636f6d301e170d3232303831393132343930365a170d3332303831363132343930365a3076310b30" +
  "0906035504061302434e310b300906035504080c02424a310b300906035504070c02424a310b30090" +
  "60355040a0c024844310c300a060355040b0c03646576310b300906035504030c0263613125302306" +
  "092a864886f70d010901161663614063727970746f6672616d65776f726b2e636f6d30820122300d0" +
  "6092a864886f70d01010105000382010f003082010a02820101009f29d08584ed6c306ed01383e01b" +
  "6108f7dd6341064b54fbf0157fe4e5d5a01ae1339e5b6fd9011738b1dc0b553c5d5c28a916c7ae886" +
  "377d21c17ad71541eb70c7f4c36b029339c9559feb41c7c43b929bd6f073e83104720212604861a8e" +
  "05f6018ade6a7e9ab9476fb647f4e1ff26d5fa406b525f86b2c5db0c07baa190b2e7a946a610ef987" +
  "3143bb6b5de3f921664e131b236c9ecae6b52da812a1a0497d8d49fa2ee358f9a6105474750da9d04" +
  "1a31d38101a1468e55bb00c78a9352bf45cff0e500fcf61b2ff4818f516ae02de0b5fbe37acc146f3" +
  "55a328abfc02bb2d6a71723cd192dedf0851db87347176053b4b868bd7a03e9db87f0ef2606aa0102" +
  "03010001a381c93081c6301d0603551d0e041604148ca33b426301b34d51f6e42db5837f18392fb7b" +
  "5301f0603551d230418301680148ca33b426301b34d51f6e42db5837f18392fb7b530120603551d13" +
  "0101ff040830060101ff020102300b0603551d0f040403020106301d0603551d250416301406082b0" +
  "601050507030106082b0601050507030230210603551d11041a3018811663614063727970746f6672" +
  "616d65776f726b2e636f6d30210603551d12041a3018811663614063727970746f6672616d65776f7" +
  "26b2e636f6d300d06092a864886f70d01010b0500038201010087ee1113a709eb6fe02d8b2c2e473b" +
  "11283b7b12b06659a2b07c8189cbb2ffe5da80e6777136e040d5e542864a6f0fe4b3f07f7089db406" +
  "61ba409b8ed2b9da3e23f1bdc63d17ee0401f70b52adb4ad3ace928e72e2614d3115c16c7348fa936" +
  "4ab9728b04507234b83ce2a2512d029b71770c719d8f9e4f941917c6e7570aad95dc9dd5c0a7f66d5" +
  "8d06f3cf6f8cfd0d66f8fec5841f8999e3bc79e9a4a8c434b45314dc4338e353697a30b98855401a0" +
  "a309c2f12d01f9fc47f5d049b8733abe9c445b0ddc919143650d6477dd58460afb8d8f1f734bff4f4" +
  "b731d66ce115ce494420158bd66a26a4b042c1ed3f1b0f813bad1b7e2d8ca09c3cb7621c07543";

var testErrorCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIEQDCCAyigAwIBAgIQICAIMRlDU0ytSEUfNeOUJTANBgkqhkiG9w0BAQsFADBcMQswCQYDVQQG\n" +
  "EwJDTjEPMA0GA1UECgwGSHVhd2VpMRMwEQYDVQQLDApIdWF3ZWkgQ0JHMScwJQYDVQQDDB5IdWF3\n" +
  "ZWkgQ0JHIE1vYmlsZSBFcXVpcG1lbnQgQ0EwHhcNMjAwODMxMTE0MzUzWhcNMzAwODI5MTE0MzUz\n" +
  "WjBvMQswCQYDVQQGEwJDTjEPMA0GA1UECgwGSHVhd2VpMRMwEQYDVQQLDApIdWF3ZWkgQ0JHMTow\n" +
  "OAYDVQQDDDFIVUFXRUlfSFdKQURfODE4ZjhjNDUtOGNmNC00ZTM2LTkxOTMtNTQ5OWMwNzM0YzM4\n" +
  "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArZcfL6ot4z6k3T4X3C26EI557Zvrx9Ci\n" +
  "hNx6RMy+vjXa3E4BkxwZ3r0ADbc+msJOq0IyQJNujaLq35oQvJgMIvBn1xFurBXdOzbygc7G9GKt\n" +
  "sb4rmKUP0QEPHM2/TrxAJT2LNPLrOE047ESe2X76FpDY6oZdsoGJ5I9m/mlfGsxR1l1TeUjwA/Rs\n" +
  "UtISR66aastBy2tU7IubP0B0Gceqy9DnjTQtY9OpkOql08H20C30iCVijK6BmP43X4OMz2MS0leV\n" +
  "K0AHmhiv6ufu166Xtc2JOXRk/MJ+53iprvVEUowKY/ZATUz6iDHDZYM3MdQV+VbFrOevUceOSweY\n" +
  "PaXCzwIDAQABo4HqMIHnMB8GA1UdIwQYMBaAFDXT2UhPcFFNI7Ey1dXdJSHOBS7dMB0GA1UdDgQW\n" +
  "BBSndBqCYYcTB1kMNhYMM4r/vDLteTARBglghkgBhvhCAQEEBAMCBsAwCwYDVR0PBAQDAgTwMGYG\n" +
  "A1UdHwRfMF0wW6BZoFeGVWh0dHA6Ly9jcGtpLWNhd2ViLmh1YXdlaS5jb20vY3BraS9zZXJ2bGV0\n" +
  "L2NybEZpbGVEb3duLmNybD9jZXJ0eXBlPTQmeWVhcj0vY3JsMjAyMC5jcmwwHQYDVR0lBBYwFAYI\n" +
  "KwYBBQUHAwEGCCsGAQUFBwMCMA0GCSqGSIb3DQEBCwUAA4IBAQCNTqZHRy7BJ+KFOflqwYkeD1Yd\n" +
  "K5XxcZUykw8AefX3SMYzSBzy7IIIhM5bvhWF6r5NnBJYqmyQfy+3K0Z0LQXfsY95U9JBkKl3nQPn\n" +
  "p1PzV8wLp/XYE7ePsbIbjQ1gQdC47sTDjoA73X4wEchdEVJBNUs2e15HRxbzaVJ6ABSKI9AHkxKv\n" +
  "o9iYKFozQaL4y+3Y+Yei/N1kiZZayJqC1uXq45kelc3SCJrVPE4g/Uspf2jjp7xsS+MkmxvSAT9X\n" +
  "OJeDWEeXyt7tvJeodRQgGZVhdtN78mtoaqWqD9Z6a6wpWdC4sZCWJfMjCu4Wd889Pn4MT5DBKBN3\n" +
  "f3+JpOzUJlM9\n" +
  "-----END CERTIFICATE-----\n";

var testCert =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIID/jCCAuagAwIBAgIBATANBgkqhkiG9w0BAQsFADCBjDELMAkGA1UEBhMCQ04x\n" +
  "ETAPBgNVBAgMCHNoYW5naGFpMQ8wDQYDVQQHDAZodWF3ZWkxFTATBgNVBAoMDHd3\n" +
  "dy50ZXN0LmNvbTENMAsGA1UECwwEdGVzdDEVMBMGA1UEAwwMd3d3LnRlc3QuY29t\n" +
  "MRwwGgYJKoZIhvcNAQkBFg10ZXN0QHRlc3QuY29tMB4XDTIyMDgyOTA2NTUwM1oX\n" +
  "DTIzMDgyOTA2NTUwM1owezELMAkGA1UEBhMCQ04xETAPBgNVBAgMCHNoYW5naGFp\n" +
  "MRUwEwYDVQQKDAx3d3cudGVzdC5jb20xDTALBgNVBAsMBHRlc3QxFTATBgNVBAMM\n" +
  "DHd3dy50ZXN0LmNvbTEcMBoGCSqGSIb3DQEJARYNdGVzdEB0ZXN0LmNvbTCCASIw\n" +
  "DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJmY9T4SzXXwKvfMvnvMWY7TqUJK\n" +
  "jnWf2Puv0YUQ2fdvyoKQ2LQXdtzoUL53j587oI+IXelOr7dg020zPyun0cmZHZ4y\n" +
  "l/qAcrWbDjZeEGcbbb5UtQtn1WOEnv8pkXluO355mbZQUKK9L3gFWseXJKGbIXw0\n" +
  "NRpaJZzqvPor4m3a5pmJKPHOlivUdYfLaKSkNj3DlaFzCWKV82k5ee6gzVyETtG+\n" +
  "XN+vq8qLybT+fIFsLNMmAHzRxlqz3NiH7yh+1/p/Knvf8bkkRVR2btH51RyX2RSu\n" +
  "DjPM0/VRL8fxDSDeWBq+Gvn/E6AbOVMmkx63tcyWHhklCSaZtyz7kq39TQMCAwEA\n" +
  "AaN7MHkwCQYDVR0TBAIwADAsBglghkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0\n" +
  "ZWQgQ2VydGlmaWNhdGUwHQYDVR0OBBYEFFiFDysfADQCzRZCOSPupQxFicwzMB8G\n" +
  "A1UdIwQYMBaAFNYQRQiPsG8HefOTsmsVhaVjY7IPMA0GCSqGSIb3DQEBCwUAA4IB\n" +
  "AQAeppxf6sKQJxJQXKPTT3xHKaskidNwDBbOSIvnVvWXicZXDs+1sF6tUaRgvPxL\n" +
  "OL58+P2Jy0tfSwj2WhqQRGe9MvQ5iFHcdelZc0ciW6EQ0VDHIaDAQc2nQzej/79w\n" +
  "UE7BJJV3b9n1be2iCsuodKO14pOkMb84WcIxng+8SD+MiFqV5BPO1QyKGdO1PE1b\n" +
  "+evjyTpFSTgZf2Mw3fGtu5hfEXyHw1lnsFY2MlSwiRlAym/gm4aXy+4H6LyXKd56\n" +
  "UYQ6fituD0ziaw3RI6liyIe7aENHCkZf6bAvMRhk4QiU4xu6emwX8Qt1bT7RthP0\n" +
  "1Vsro0IOeXT9WAcqEtQUegsi\n" +
  "-----END CERTIFICATE-----\n";

var testCrlPem =
  "-----BEGIN X509 CRL-----\n" +
  "MIIB/DCB5QIBATANBgkqhkiG9w0BAQsFADCBjDELMAkGA1UEBhMCQ04xETAPBgNV\n" +
  "BAgMCHNoYW5naGFpMQ8wDQYDVQQHDAZodWF3ZWkxFTATBgNVBAoMDHd3dy50ZXN0\n" +
  "LmNvbTENMAsGA1UECwwEdGVzdDEVMBMGA1UEAwwMd3d3LnRlc3QuY29tMRwwGgYJ\n" +
  "KoZIhvcNAQkBFg10ZXN0QHRlc3QuY29tFw0yMjA4MjkwNzAwMTRaFw0yMjA5Mjgw\n" +
  "NzAwMTRaMBQwEgIBARcNMjIwODI5MDY1OTUzWqAOMAwwCgYDVR0UBAMCAQAwDQYJ\n" +
  "KoZIhvcNAQELBQADggEBAHpfFhhUR59OAvOSuKDQUC5tKeLEuPbY8bYdmQVI8EFd\n" +
  "xDkZTXmT3CX1aDPYKVsG/jH9KPAmCV/ODKEGiJzclb3Z4am7tT+Wy4mpXypNS1od\n" +
  "wPDcQGsMrjT6iSp6JImiB0dDDSleBTBcYR/hhtFaiGSncyqJ0mhyaXPxIkNOO6nY\n" +
  "v+rcTEPQWavViDRyNDhnTbN868I3fzFVBcidF13CA0sCJ91ZvsE9h/YmPO2+e0YE\n" +
  "IUgzn37UOiLGObCVBY12QjGiuvVvCl7ncncsFEJuGfvONOqyFHjyxDHo5W0fqTn2\n" +
  "eCtiNcgUr9Kz2bwCmvEXhP7PuF4RMLq4vfzi0YjCG98=\n" +
  "-----END X509 CRL-----\n";

var testCrlDer =
  "308201fc3081e5020101300d06092a864886f70d01010b0500" +
  "30818c310b300906035504061302434e3111300f06035504080c087368616e67686" +
  "169310f300d06035504070c0668756177656931153013060355040a0c0c7777772e" +
  "746573742e636f6d310d300b060355040b0c04746573743115301306035504030c0" +
  "c7777772e746573742e636f6d311c301a06092a864886f70d010901160d74657374" +
  "40746573742e636f6d170d3232303832393037303031345a170d323230393238303" +
  "7303031345a30143012020101170d3232303832393036353935335aa00e300c300a" +
  "0603551d140403020100300d06092a864886f70d01010b050003820101007a5f161" +
  "854479f4e02f392b8a0d0502e6d29e2c4b8f6d8f1b61d990548f0415dc439194d79" +
  "93dc25f56833d8295b06fe31fd28f026095fce0ca106889cdc95bdd9e1a9bbb53f9" +
  "6cb89a95f2a4d4b5a1dc0f0dc406b0cae34fa892a7a2489a20747430d295e05305c" +
  "611fe186d15a8864a7732a89d268726973f122434e3ba9d8bfeadc4c43d059abd58" +
  "834723438674db37cebc2377f315505c89d175dc2034b0227dd59bec13d87f6263c" +
  "edbe7b46042148339f7ed43a22c639b095058d764231a2baf56f0a5ee772772c144" +
  "26e19fbce34eab21478f2c431e8e56d1fa939f6782b6235c814afd2b3d9bc029af1" +
  "1784fecfb85e1130bab8bdfce2d188c21bdf";

var crlVerifyPriKeyHex =
  "30820277020100300D06092A864886F70D0101010500048202613082025D020100028" +
  "18100DC4C2D57493D42521A09ED3E902951F77015FE76B0DBDFA12C6C6795DA633D4F" +
  "71488C3EFA2479E9F2F220CBF1596BEDC872666E31D4F3CE0B12C41739B45216D3E3C" +
  "0F848B3F640D54723307FA7C55A5ABB5C7BEF69E27435242225457EFCE8C45265A04E" +
  "BCFD3FD985148A5A9302246C19BA81BE652ECBBBE9917B7C47C261020301000102818" +
  "05ACF0FF5A61C19658C9440F6842874404234DEC3005E724D96E94CBDC9DB149FD5BB" +
  "A90C20C2BE7A8089EC9904F0EE7B83201D37195585F68E3BFB16F3D36FEE731253CA7" +
  "7D76C29F508A309010B000557AD4DF092B25A8B19098186FE66B9338828F33773095F" +
  "D7C9C6FA1374FEAE53A97167CE3AE68D35D1B8FD6F0D43C2D1024100F733E56C295A3" +
  "058A45265A039C2E8AE5FA32D0C65B17BFD92BF47879740CB54F9BB50277051D0D848" +
  "0DC64760F84E0A32766DA4BA40E558F84A394EF83F4E2D024100E4232A5F59CF7C912" +
  "40DA24417CD37DE1F534D339F904DD9726425BAAB4791C4999586B58AEA77F764725E" +
  "B7BB16A164A4E12D766DEFB15ED617E8AAB6A0D985024100DFC85B284F4715FD28C46" +
  "EBB5D8ED495067EF1890786647869203FE0BF4C28C6044D4D82666BAA6420D65768C6" +
  "A00205B928FC98E3035C9BEE294337FA0355010240695B7C2410DBEB9133EF3FF2E67" +
  "315CBF4F7897DBFC0EAD2F32B20E976545513504267B5CB73C0F77562043021ACAFD8" +
  "44F4E104027D61928499021064CB1FE9024100AB4B7D907C57086BC04372098A18353" +
  "6649D848DF1849448C6809DB9A2580A4D0ACA1ED605555BFED7AA70ED76B3402EA0B3" +
  "3237B0A0B9962DC470E99910678D";

var crlVerifyPubKeyHex =
  "30819F300D06092A864886F70D010101050003818D0030818902818100DC4C2D57493" +
  "D42521A09ED3E902951F77015FE76B0DBDFA12C6C6795DA633D4F71488C3EFA2479E9" +
  "F2F220CBF1596BEDC872666E31D4F3CE0B12C41739B45216D3E3C0F848B3F640D5472" +
  "3307FA7C55A5ABB5C7BEF69E27435242225457EFCE8C45265A04EBCFD3FD985148A5A" +
  "9302246C19BA81BE652ECBBBE9917B7C47C2610203010001";

var crlHex =
  "3081F3305E020103300D06092A864886F70D010104050030153113301106035504031" +
  "30A43524C20697373756572170D3137303830373131313935355A170D333231323134" +
  "3030353332305A30153013020203E8170D3332313231343030353332305A300D06092" +
  "A864886F70D010104050003818100210F1E195A093580E36CA479A3B24744864081C8" +
  "39447781C0C72752DA37088BFA00F123DACC426961B1418998F20F751B3DB98C88F9F" +
  "F39E25B16622B03D8F504A67DC36C4BF3C18790E52A90A0F0E833E61F6596B6DE1A13" +
  "2ECBB9DADA17A1B3FBE2C7FFF4AE74D69FFEF219B844E30B068453F3A190298EA079A" +
  "BEC1F4437";

export {
  rootCert,
  chainFirstCaCert,
  chainSecondCaCert,
  testCert,
  testCrlDer,
  testCrlPem,
  testErrorCert,
  testInvalidCert,
  deviceTestCert,
  selfSignedCaCertPem,
  selfSignedCaCertDer,
  crlVerifyPriKeyHex,
  crlVerifyPubKeyHex,
  crlHex,
};
