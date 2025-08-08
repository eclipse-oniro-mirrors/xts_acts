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
 
let rsaPem4096: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIFCTCCAvGgAwIBAgIUIfrbjbL42oQPJInVMjnamqge4O0wDQYJKoZIhvcNAQEL\n' +
  'BQAwFDESMBAGA1UEAwwJdGVzdCBjZXJ0MB4XDTI1MDIyNTAyMjYxMVoXDTM1MDIy\n' +
  'MzAyMjYxMVowFDESMBAGA1UEAwwJdGVzdCBjZXJ0MIICIjANBgkqhkiG9w0BAQEF\n' +
  'AAOCAg8AMIICCgKCAgEApB5xR+Ej/+SEXZj190SRElRoAQnCRS1/3rD9VorlzzOZ\n' +
  'b9dEBYDGGZncCdGB/7Ptt+XQmza5pmKLMuxt6cvXMvJSMgQSPnnXjLGiU+t/x6pi\n' +
  'i4SbgBH1tE5sK/h5/Xco9CxOLTC01/RPD/Oz5hrBqWp52L3rNskxKiLT+qLOg999\n' +
  'bwqFtVLiynp9R43fcbbgd6Ihiv2V93Q4AIXNWqARJnlPisTkqK3eFEJoxY6jIQ31\n' +
  'XCjdHFCigrR1lqdcBcLAQoA/XSv/ke8OsoSJNL3p/Uzphe9sB2cCH5vPn8J+DuIc\n' +
  'MdRgdXKa9ZA2su00KQz72ywd5pX/bWsyDWYs5R9T3rx3KCJiWvbfUscAWMHqmldk\n' +
  'Ln93Kkq/WtywML0+KICI/iIL0GaAGvUmcqeXUnEnFrVxXh+c4GcGt4GBeKKtCS9N\n' +
  'mR8FdC0Pb9cosfPwUmAwWNzzRDlqOC/tiyBpTLgHOu7B/dR305u35FAtlAytFVIh\n' +
  'iplPDDQvRQs0T+dJxOQwtxqwYTDMHHfwoC7YNs8//emodZrUpy8o0tPsVTKumJVw\n' +
  'WIHe9hvYLgRq24cqDseitsC8WbHcziBXe/BFdavVHVGdzY4EsiIbFUzoksW/M5zS\n' +
  'iDw2jF5YVjfzms2OG7/loixUZk0kCntcA8dBouNdcNHheV1kYLf8gmI6PUJz/u8C\n' +
  'AwEAAaNTMFEwHQYDVR0OBBYEFKf3YHkXWO0UdAlSxeT2q0JfJs1wMB8GA1UdIwQY\n' +
  'MBaAFKf3YHkXWO0UdAlSxeT2q0JfJs1wMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZI\n' +
  'hvcNAQELBQADggIBAFPE7O+mafMh/PKHIwaYIQ5vvemk4Ev0uRP0+mKcg9T8Q2FS\n' +
  'dSiCVVWke4Np3fLyElZKsAtW2W4tQWhvyppbcZy2JF1+90DXSU0QoLa0FcMNeWRE\n' +
  'JacugjwFp+QTPpeAuwFketYErWzjXnCKoxCyv1PmGNSVDHzWn39SxU4nZqVfX2cr\n' +
  'i6BhYQLRkUgEzXZk/MsfCkmaU+uM1RK7D+aAqmUCwjH3hrQQb2VpzzlxWBoXSXiC\n' +
  '/BIef2qQA5fnhW9J15A79bM//e2vbq06S1ZdnGuuM74ADaIpPMxYdUj/DM4YWDoL\n' +
  'WAyCtMszNJZ0oQVdqwHryZjjIChIZo89w31KHgOGMGlAhK6xTNNAtl5fCXmrWPY7\n' +
  '82nEd4KRDH6Ph/3zb8eIa2LT1tVc6XGLMQo3R5Mto+Z4JpmzhamI4gC/Wis/ipkr\n' +
  'L7nTp1ofnEoewr8i0I1F86WTQPg8SoeCBjYm8xPl53DDqL8oN/jW9PMc6aTYVSk1\n' +
  '/Tm+mmCxCHJG8npjSVlOyuSM7jscyJoyHAhEAhmNp+hKQrdBDChV5YQLvdxaW7CO\n' +
  '1TbE6a+UQiZjFlGFFbkIXqymgj2WVZoAUQI725uhLGFFdqenN8rjSlacmQA0oh8v\n' +
  'JezJ09wkPqLhEvtL1uguflNDaWr6QceuFCkP6D/77uWgcP/2H1AcFOqXvR+1\n'     +
  '-----END CERTIFICATE-----'

let rsaPem4096_other: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIFCTCCAvGgAwIBAgIUKO7BZtitjyW2UwweqHSpR8mxayowDQYJKoZIhvcNAQEL\n' +
  'BQAwFDESMBAGA1UEAwwJdGVzdCBjZXJ0MB4XDTI1MDIyNTAzMDAxM1oXDTM1MDIy\n' +
  'MzAzMDAxM1owFDESMBAGA1UEAwwJdGVzdCBjZXJ0MIICIjANBgkqhkiG9w0BAQEF\n' +
  'AAOCAg8AMIICCgKCAgEAuqGj0nG0C91j5XDwx1YQGjlOl1cQI9v+8COHK5nZE1+k\n' +
  'DQPXCgDx1euUDZY2KGFeVz/NMrbvkrm5mDZNYq60mcip8lzwo0KpfYDoA+SPSO8y\n' +
  'LAYbJaS7a79GfzpATDYJbRgVi4Jwges/jqHsE3OjevqJtAhsgP9LM4nUo7MsaKn9\n' +
  'kvdOdWYh3bPslUKqwSMsP+NxfYqRCgs4kGnMPqFSxeJhbFTHu0/VMNIFbJo13bPx\n' +
  '77qSkoJ1TsBfI/F4LxfwVfy95cpLuhpv8GVc6240+b0HVHkp9ZKS7KLFLabcMjc2\n' +
  'B2ZQBzfOQaWOv16o0wVxm3M69eqvk1L3r2kRX/nMnBAoyNzbkaG4wN7aPCE8h5sR\n' +
  'Y884KdfJ5Rl8Rqva6KdjwFgYe0RLtZYWavCWIB2ixVXoI9OlzKTUQj4piPYjF3gT\n' +
  '+t0gGs/baTqUy6b74RJFqAruWXYa2JhClt8gNsPR6GJAv/koBJwcW4u4LeKFpfvh\n' +
  'ws2Wa4v1kDnV+Zaz5IeN+SSUlwIX+/sAbtS0WgHCnbL5b0JKLa9udVzG8uTZfn7C\n' +
  'FY/X9XFn9xdYCbVBBtUeT+J/xqrMMa+xNq2zPR3IpFggF4Pp9+5KYEOPd9PgQcJC\n' +
  'zf7FF8NAcGNGNuaQyPWxYeFgkwPIARzx5VMT/G4AbUqyMHzIw6jc2FgpHs5fCD8C\n' +
  'AwEAAaNTMFEwHQYDVR0OBBYEFEgL9LZAkofAdQpWueSicK3ukW3LMB8GA1UdIwQY\n' +
  'MBaAFEgL9LZAkofAdQpWueSicK3ukW3LMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZI\n' +
  'hvcNAQELBQADggIBAA18Wz7rJBcnOfrfJgJhP8MdC0t6tx9u8iDtiqq3NyJTQh+D\n' +
  'AwpjHf62PkPqMTrTuAtclt1V+uaO5dxK5X8AazsprPtkUNVpihUhI9/sbYXMR1qH\n' +
  'j/28801aVxo90Jj60DbVBLdeCAtAqhh7/RhafXLBe6z89qK4esrLqzChybNkjbbv\n' +
  'CJ7s+Ms4m9fXsOB5uBEMoQfKkYNtSFCVLb+F/TWCp8lFZQdohw+KrgqUlNtqkBEV\n' +
  '1Mg8yx1lYEAJGdaBf8X3xil0NT2PTCg+nM/Sq9WjhfevnbFHFXc0NCeOJATw8HMj\n' +
  'pyrEJd0YNS34VT1NFMBQz5DJZAcu21/30wY8WXcj0u8YHLfCORF89TdndZHYpmAH\n' +
  'lKQMCdeCQExBvas/4JrW7IW1bYAbPvc8ToeOnTCkto2EPhUFXlSVDrTNN3RXciM0\n' +
  'VE+dzhOvE41nD+APoFwDKZz+EhAKKvN0DV9V6imGjc2XQY/nN/INwV2xNcPyZ/3a\n' +
  'iva9ezsJb5+dx6vj68ZBlGPF0so0vbZu65hUdKXVhxKy0RC66VCISHHHXyUCqWR1\n' +
  'rtY8mYK0Sx7G7WgEnl3pHFLqUHJ9XzCkAEhn8qtmn9vCMnwxw2wjKnRdrsIcMGIg\n' +
  '/1j5goUcqFH45FVOK6zeaILn94twF8HkkpEyc78R9ssLkJsd5ScAEtecCHDF\n'     +
  '-----END CERTIFICATE-----'

let crlPem: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIHzMF4CAQMwDQYJKoZIhvcNAQEEBQAwFTETMBEGA1UEAxMKQ1JMIGlzc3VlchcN\n' +
  'MTcwODA3MTExOTU1WhcNMzIxMjE0MDA1MzIwWjAVMBMCAgPoFw0zMjEyMTQwMDUz\n' +
  'MjBaMA0GCSqGSIb3DQEBBAUAA4GBACEPHhlaCTWA42ykeaOyR0SGQIHIOUR3gcDH\n' +
  'J1LaNwiL+gDxI9rMQmlhsUGJmPIPdRs9uYyI+f854lsWYisD2PUEpn3DbEvzwYeQ\n' +
  '5SqQoPDoM+YfZZa23hoTLsu52toXobP74sf/9K501p/+8hm4ROMLBoRT86GQKY6g\n' +
  'eavsH0Q3\n'                                                         +
  '-----END X509 CRL-----\n'

let revokedCertPem: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBLzCB1QIUO/QDVJwZLIpeJyPjyTvE43xvE5cwCgYIKoZIzj0EAwIwGjEYMBYG\n' +
  'A1UEAwwPRXhhbXBsZSBSb290IENBMB4XDTIzMDkwNDExMjAxOVoXDTI2MDUzMDEx\n' +
  'MjAxOVowGjEYMBYGA1UEAwwPRXhhbXBsZSBSb290IENBMFkwEwYHKoZIzj0CAQYI\n' +
  'KoZIzj0DAQcDQgAEHjG74yMIueO7z3T+dyuEIrhxTg2fqgeNB3SGfsIXlsiUfLTa\n' +
  'tUsU0i/sePnrKglj2H8Abbx9PK0tsW/VgqwDIDAKBggqhkjOPQQDAgNJADBGAiEA\n' +
  '0ce/fvA4tckNZeB865aOApKXKlBjiRlaiuq5mEEqvNACIQDPD9WyC21MXqPBuRUf\n' +
  'BetUokslUfjT6+s/X4ByaxycAA==\n'                                     +
  '-----END CERTIFICATE-----\n'

let crlCert: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIH4MIGeAgEBMAoGCCqGSM49BAMCMEYxCzAJBgNVBAYTAkNOMR0wGwYDVQQKDBRJ\n' +
  'bnRlcm1lZGlhdGUgQ0EgQ29ycDEYMBYGA1UEAwwPSW50ZXJtZWRpYXRlIENBFw0y\n' +
  'NDExMTEwNjU2MjlaFw0yNDEyMTEwNjU2MjlaMCcwJQIUW3oLTj8/yzqzZboz0Zfe\n' +
  '7imIQugXDTI0MTExMTA2NTYyOVowCgYIKoZIzj0EAwIDSQAwRgIhAOp687ZSV59b\n' +
  '7SeGxPXJf/Q5puupMDq4GVeGIAZQhHrlAiEAzLKSj63sFIhQQZ9eOp3qz4+ZG4R7\n' +
  'O8pwkKl7Asnh9hY=\n'                                                 +
  '-----END X509 CRL-----'

let crlRevokedCert: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBtjCCAVygAwIBAgIUW3oLTj8/yzqzZboz0Zfe7imIQugwCgYIKoZIzj0EAwIw\n' +
  'RjELMAkGA1UEBhMCQ04xHTAbBgNVBAoMFEludGVybWVkaWF0ZSBDQSBDb3JwMRgw\n' +
  'FgYDVQQDDA9JbnRlcm1lZGlhdGUgQ0EwHhcNMjQxMTExMDY1NjI5WhcNMjUxMTEx\n' +
  'MDY1NjI5WjBeMQswCQYDVQQGEwJDTjEQMA4GA1UECAwHQmVpamluZzEQMA4GA1UE\n' +
  'BwwHQmVpamluZzEVMBMGA1UECgwMRXhhbXBsZSBDb3JwMRQwEgYDVQQDDAtleGFt\n' +
  'cGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABBX5rOX5vy6Rw3V72OT4\n' +
  'A674VpVRJ58l7rxbB+zxMQHglQ6gu61j5eKumtXYrSSllGO1I+IWH6v1sXJUp0WG\n' +
  'uyyjEDAOMAwGA1UdEwEB/wQCMAAwCgYIKoZIzj0EAwIDSAAwRQIgEmSgBr9wgJYn\n' +
  'MrOvDiVoht8MekqCw9Q6wjTKAnWMd1UCIQDk7FLDwRBrLQ5QnkgTUO8+akRyhgf6\n' +
  'Y6XTVhV1ASQNSQ==\n'                                                 +
  '-----END CERTIFICATE-----'

let crlSignPubKey: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBlDCCATqgAwIBAgIUVD1E378HYogLPkk9u6c6SAXUjygwCgYIKoZIzj0EAwIw\n' +
  'NjELMAkGA1UEBhMCQ04xFTATBgNVBAoMDFJvb3QgQ0EgQ29ycDEQMA4GA1UEAwwH\n' +
  'Um9vdCBDQTAeFw0yNDExMTEwNjU2MjlaFw0yOTExMTAwNjU2MjlaMEYxCzAJBgNV\n' +
  'BAYTAkNOMR0wGwYDVQQKDBRJbnRlcm1lZGlhdGUgQ0EgQ29ycDEYMBYGA1UEAwwP\n' +
  'SW50ZXJtZWRpYXRlIENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEcGoPz3oq\n' +
  'TPp7Q7oG9/i9Rdv5coJd7+IN33Gh2m1d8iLb+s4qaKSpIErD16ZEg4QFZRhkbgjy\n' +
  '5PDM1gkAwPhIUKMWMBQwEgYDVR0TAQH/BAgwBgEB/wIBATAKBggqhkjOPQQDAgNI\n' +
  'ADBFAiEAhsfatnni40DxT6kJn/zRzJAbGkN+a4dXVAMDNZG3e6QCICBY8NdTaQFm\n' +
  'D0z1qppY+t4AEL5sMJFnxHWVXp7ARdOA\n'                                 +
  '-----END CERTIFICATE-----'

export {
  rsaPem4096,
  rsaPem4096_other,
  crlPem,
  revokedCertPem,
  crlCert,
  crlRevokedCert,
  crlSignPubKey,
}