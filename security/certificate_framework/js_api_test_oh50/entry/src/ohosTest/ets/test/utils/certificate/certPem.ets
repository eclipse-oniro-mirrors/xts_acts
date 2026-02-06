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
import { cert } from "@kit.DeviceCertificateKit"
import { stringTouInt8Array } from "../common/commonFunction"


let certPemZh: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIID5jCCAs6gAwIBAgIGAXKnJjrBMA0GCSqGSIb3DQEBCwUAMHcxCzAJBgNVBAYT\n' +
  'AkNOMRowGAYDVQQIDBHpmZXopb8gSEFJIDEzPC4uPjEZMBcGA1UEBwwQSGVsbG8g\n' +
  'MzIxIOilv+WuiTEVMBMGA1UECgwMSGVsbG8g5rWL6K+VMRowGAYDVQQDDBHkuK3m\n' +
  'lofmtYvor5UgVGVzdDAeFw0yNTA0MTQwNjIyNDFaFw0zNTA0MTIwNjIyNDFaMHcx\n' +
  'CzAJBgNVBAYTAkNOMRowGAYDVQQIDBHpmZXopb8gSEFJIDEzPC4uPjEZMBcGA1UE\n' +
  'BwwQSGVsbG8gMzIxIOilv+WuiTEVMBMGA1UECgwMSGVsbG8g5rWL6K+VMRowGAYD\n' +
  'VQQDDBHkuK3mlofmtYvor5UgVGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC\n' +
  'AQoCggEBAK97U95SJdexGNZi5hn1FRAz7vEBcjeshgR/JXY2IkWAsC8DoCT/6BHg\n' +
  'kIPE+IPqbqnYqRbRywkgDnYB8ymKA4znoVa2e7ZARa4RZKz8zBlEe710pNL5Je82\n' +
  'L+FIJQtLMwb5KiWpMC8V6KcJZRHIKNy4xcwbEv5Q/6joJGqKVLsAEfK2uFrVEz+g\n' +
  'F8F8+rKnHMiIYXP/oLcaK63DAjyUXEYERDHnYhRcvLEzQHI8fMylkrta/KHu7gKt\n' +
  'Knp0MCK0h6nfPZi8hsbTKUKVcLzTdFxeVQbqnoF4LHK3+F8y+st3K6j4iIol0g7j\n' +
  'TyCkAzZeUzBZX4pfp7l8gfygRLTbdiUCAwEAAaN4MHYwEgYDVR0TAQH/BAgwBgEB\n' +
  '/wIBATAOBgNVHQ8BAf8EBAMCBaAwJwYDVR0lBCAwHgYIKwYBBQUHAwEGCCsGAQUF\n' +
  'BwMCBggrBgEFBQcDCTAnBgNVHREEIDAeggtleGFtcGxlLmNvbYIPd3d3LmV4YW1w\n' +
  'bGUuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQAvaHk/T6Q9vTYeTmkpz6w0utvJSW3L\n' +
  '2U0/RHZy8vGniJNu/MMN3GZChizRbjiCPdfBeat8ZhZ6jiD0t9jm7W6xz9BklHhL\n' +
  'relu3hjV7Oni+3/ytbAu+eGy6gOQYePY5aslZGnKFW7Rrra78trAMWEdAsjUQWWo\n' +
  'd+sN9XvkpGPjNtlfH4i7x/gGUreIevbfViek26jYArhHUcxCaZAhMzZSU/3AqTal\n' +
  'S7oHZKS0fZUjlCs+6vxxCmQcqIktii4jVy1od6S/dax8cAGD9GEfNOQUcPI2VU2a\n' +
  'WwM8H889EWts9oK02rFJUYMCs1qCphPUWgnbouoHGXfjLAmIi3IsTEov\n'         +
  '-----END CERTIFICATE-----'

let certPemEn: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIDojCCAoqgAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYT\n' +
  'AkNOMRAwDgYDVQQIDAdzaGFuIHhpMQ4wDAYDVQQHDAV4aSBhbjESMBAGA1UECgwJ\n' +
  'byAxMSB0ZXN0MRAwDgYDVQQDDAd0ZXN0MzIxMB4XDTI1MDQxNDA2MjA1NVoXDTM1\n' +
  'MDQxMjA2MjA1NVowVTELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW4geGkxDjAM\n' +
  'BgNVBAcMBXhpIGFuMRIwEAYDVQQKDAlvIDExIHRlc3QxEDAOBgNVBAMMB3Rlc3Qz\n' +
  'MjEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCve1PeUiXXsRjWYuYZ\n' +
  '9RUQM+7xAXI3rIYEfyV2NiJFgLAvA6Ak/+gR4JCDxPiD6m6p2KkW0csJIA52AfMp\n' +
  'igOM56FWtnu2QEWuEWSs/MwZRHu9dKTS+SXvNi/hSCULSzMG+SolqTAvFeinCWUR\n' +
  'yCjcuMXMGxL+UP+o6CRqilS7ABHytrha1RM/oBfBfPqypxzIiGFz/6C3GiutwwI8\n' +
  'lFxGBEQx52IUXLyxM0ByPHzMpZK7Wvyh7u4CrSp6dDAitIep3z2YvIbG0ylClXC8\n' +
  '03RcXlUG6p6BeCxyt/hfMvrLdyuo+IiKJdIO408gpAM2XlMwWV+KX6e5fIH8oES0\n' +
  '23YlAgMBAAGjeDB2MBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0PAQH/BAQDAgWg\n' +
  'MCcGA1UdJQQgMB4GCCsGAQUFBwMBBggrBgEFBQcDAgYIKwYBBQUHAwkwJwYDVR0R\n' +
  'BCAwHoILZXhhbXBsZS5jb22CD3d3dy5leGFtcGxlLmNvbTANBgkqhkiG9w0BAQsF\n' +
  'AAOCAQEAEk+j/mH188+/YE+C7FIWad5biacSXJ/o7ioLBQ/RcqUjVrXjcCNX7bM9\n' +
  'blghm0iPvO1Bo866WuemKvQ2s9tYdQ3Qfu6t43yjft5+ORQETofdeAFcu9dmNjvB\n' +
  'u090kRJA33owbaSq3KDLkG7K+pAtF4mDNdEuaYCQrpIkF2f/XbFIcFXUix0+5fU5\n' +
  's+M36w9gW7/WTIK0DimrVpX2TjMtsoBSxtOVoX4c2dlMeHsSchUiyajJR7W3AtGV\n' +
  'HD2jFQGbYzhmCFURGNiwJbEaCyIJ57xjaq/JSsoORiB2wbHUG8sPwVtGyqlFvADk\n' +
  'tkoPiQ3TXq73p1gJicz6f0N4kCVu+Q==\n'                                 +
  '-----END CERTIFICATE-----'

let certPemMultipleCNZh: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIEXDCCA0SgAwIBAgIGAXKnJjrCMA0GCSqGSIb3DQEBCwUAMIGxMQswCQYDVQQG\n' +
  'EwJDTjEaMBgGA1UECAwR6ZmV6KW/IEhBSSAxMzwuLj4xGTAXBgNVBAcMEEhlbGxv\n' +
  'IDMyMSDopb/lrokxFTATBgNVBAoMDEhlbGxvIOa1i+ivlTEaMBgGA1UEAwwR5Lit\n' +
  '5paH5rWL6K+VIFRlc3QxGzAZBgNVBAMMEuS4reaWh+a1i+ivlSBUZXN0MTEbMBkG\n' +
  'A1UEAwwS5Lit5paH5rWL6K+VIFRlc3QyMB4XDTI1MDQxNDA5MTU1MVoXDTM1MDQx\n' +
  'MjA5MTU1MVowgbExCzAJBgNVBAYTAkNOMRowGAYDVQQIDBHpmZXopb8gSEFJIDEz\n' +
  'PC4uPjEZMBcGA1UEBwwQSGVsbG8gMzIxIOilv+WuiTEVMBMGA1UECgwMSGVsbG8g\n' +
  '5rWL6K+VMRowGAYDVQQDDBHkuK3mlofmtYvor5UgVGVzdDEbMBkGA1UEAwwS5Lit\n' +
  '5paH5rWL6K+VIFRlc3QxMRswGQYDVQQDDBLkuK3mlofmtYvor5UgVGVzdDIwggEi\n' +
  'MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCve1PeUiXXsRjWYuYZ9RUQM+7x\n' +
  'AXI3rIYEfyV2NiJFgLAvA6Ak/+gR4JCDxPiD6m6p2KkW0csJIA52AfMpigOM56FW\n' +
  'tnu2QEWuEWSs/MwZRHu9dKTS+SXvNi/hSCULSzMG+SolqTAvFeinCWURyCjcuMXM\n' +
  'GxL+UP+o6CRqilS7ABHytrha1RM/oBfBfPqypxzIiGFz/6C3GiutwwI8lFxGBEQx\n' +
  '52IUXLyxM0ByPHzMpZK7Wvyh7u4CrSp6dDAitIep3z2YvIbG0ylClXC803RcXlUG\n' +
  '6p6BeCxyt/hfMvrLdyuo+IiKJdIO408gpAM2XlMwWV+KX6e5fIH8oES023YlAgMB\n' +
  'AAGjeDB2MBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0PAQH/BAQDAgWgMCcGA1Ud\n' +
  'JQQgMB4GCCsGAQUFBwMBBggrBgEFBQcDAgYIKwYBBQUHAwkwJwYDVR0RBCAwHoIL\n' +
  'ZXhhbXBsZS5jb22CD3d3dy5leGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEA\n' +
  'DI9GrsiLGnzppFmQDix2nS2EylrBKtjHErtDMKWWcj1humnJCpBpgOaCByripocs\n' +
  'BhBsaqXz/NU+Qv7ldMsZpcztrS5BZT4/h4WiZagIIIXDXPSH74K/DswDvwbTnSc8\n' +
  '6pD3J6tHW+LkU5O1G8tNSFwA85wohEjtbCHZVwf6hpt5pi1md44SEoR2CY74XUfn\n' +
  '1DWPR+5ODofNQpMhz8rcS1LGW/j5ZqcuBlJKFXAm+ZbZpawzA5IWBiayqPdZD0U7\n' +
  'OYHX/dzfpjqMAvHDuK/dBoCKg/mzp3kiY+JcwJMModMRaP82MMj0Jo3zhIPtTX05\n' +
  'YGsUS9jQ57YadGQKoYHIcA==\n'                                         +
  '-----END CERTIFICATE-----'

let DNZh: string =
  "/CN=中文TEST/OU=中文TEST/O=中文TEST/L=中文TEST/ST=中文TEST/C=CN/CN=中文TEST/CN=中文TEST"

let DNEn: string =
  "/CN=TEST/OU=TEST/O=TEST/L=TEST/ST=TEST/C=US/CN=TEST/CN=TEST"

let chainPemZh: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBlDCCATqgAwIBAgIUUx7GjuLeFC9f1yynoTZrpmYcKKYwCgYIKoZIzj0EAwIw\n' +
  'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
  'BAMMC1Jvb3QgQ0Eg5qC5MB4XDTI1MDQxNDExMTgzM1oXDTM1MDQxMjExMTgzM1ow\n' +
  'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
  'BAMMC1Jvb3QgQ0Eg5qC5MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE81102cdB\n' +
  'L08fkx5wxCG/mSQJdMu1xxpMGj2XUgenzbgYyHZ7ofe2YUTpWMjCIifhc4IVEZIN\n' +
  'UCleLn8xGa0x56MWMBQwEgYDVR0TAQH/BAgwBgEB/wIBAjAKBggqhkjOPQQDAgNI\n' +
  'ADBFAiEAolWYyEaFijGBI/SuEc6o4n7WUdkFjLRKTUJeSgdZhrcCIEU2J0TAqYyv\n' +
  'MGUzacduh8zp0BOC+65o9xcEhE3SQI10\n'                                 +
  '-----END CERTIFICATE-----\n'                                        +
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBpDCCAUqgAwIBAgIUe8ZyZme9A2eMurr+FFMx1VMcsSAwCgYIKoZIzj0EAwIw\n' +
  'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
  'BAMMC1Jvb3QgQ0Eg5qC5MB4XDTI1MDQxNDExMTgzM1oXDTMwMDQxMzExMTgzM1ow\n' +
  'TjELMAkGA1UEBhMCQ04xITAfBgNVBAoMGEludGVybWVkaWF0ZSBDQSBDb3JwIOag\n' +
  'uTEcMBoGA1UEAwwTSW50ZXJtZWRpYXRlIENBIOaguTBZMBMGByqGSM49AgEGCCqG\n' +
  'SM49AwEHA0IABNQx7KpHpTNn3IH8RWJFovnhDOhunvCd3qwA+JnOlMb+uFlWR9+G\n' +
  'K2fVwBDK6SfWRshjXDRHNlgwyFwW/6MRER6jFjAUMBIGA1UdEwEB/wQIMAYBAf8C\n' +
  'AQEwCgYIKoZIzj0EAwIDSAAwRQIhAOVFcYNW+4YM7O3QkLRyJlewfdO7Qf2JhZUd\n' +
  '1VFnIBtiAiAE0WLkHU505yMAcBy82JrcPlJrz+RI/AaQVJggChDaNg==\n'         +
  '-----END CERTIFICATE-----\n'                                        +
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIB1TCCAXqgAwIBAgIUWtiIpmIHUuHgg/VbT4ZaL1XyhBEwCgYIKoZIzj0EAwIw\n' +
  'TjELMAkGA1UEBhMCQ04xITAfBgNVBAoMGEludGVybWVkaWF0ZSBDQSBDb3JwIOag\n' +
  'uTEcMBoGA1UEAwwTSW50ZXJtZWRpYXRlIENBIOaguTAeFw0yNTA0MTQxMTE4MzNa\n' +
  'Fw0yNjA0MTQxMTE4MzNaMHQxCzAJBgNVBAYTAkNOMRcwFQYDVQQIDA5CZWlqaW5n\n' +
  'IOWMl+S6rDEXMBUGA1UEBwwOQmVpamluZyDljJfkuqwxGTAXBgNVBAoMEEV4YW1w\n' +
  'bGUgQ29ycCDll6gxGDAWBgNVBAMMD2V4YW1wbGUuY29tIOS+izBZMBMGByqGSM49\n' +
  'AgEGCCqGSM49AwEHA0IABG8nx9wUfJRf6B6U2oCuF+8XLLON7xIBPSAYNJnL9BD8\n' +
  'BsWchcDiMiBVBZeLWq3Xm25hKuCvwM/NCNttixtC3FSjEDAOMAwGA1UdEwEB/wQC\n' +
  'MAAwCgYIKoZIzj0EAwIDSQAwRgIhALf2V8Fu8Da8fNi8q+Xs2nNagtohc7X6Uhkm\n' +
  'IGIoFO3xAiEA8kKITUqwI5TDSm18vb44sg2nm55WgYPZ6oIuchLq9mA=\n'         +
  '-----END CERTIFICATE-----'

let certErrorCNPem: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIDozCCAougAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFYxDDAKBgNVBAYT\n' +
  'A0MxTjEQMA4GA1UECAwHc2hhbiB4aTEOMAwGA1UEBwwFeGkgYW4xEjAQBgNVBAoM\n' +
  'CW8gMTEgdGVzdDEQMA4GA1UEAwwHdGVzdDMyMTAeFw0yNTA0MTQwNjIwNTVaFw0z\n' +
  'NTA0MTIwNjIwNTVaMFUxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuIHhpMQ4w\n' +
  'DAYDVQQHDAV4aSBhbjESMBAGA1UECgwJbyAxMSB0ZXN0MRAwDgYDVQQDDAd0ZXN0\n' +
  'MzIxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr3tT3lIl17EY1mLm\n' +
  'GfUVEDPu8QFyN6yGBH8ldjYiRYCwLwOgJP/oEeCQg8T4g+puqdipFtHLCSAOdgHz\n' +
  'KYoDjOehVrZ7tkBFrhFkrPzMGUR7vXSk0vkl7zYv4UglC0szBvkqJakwLxXopwll\n' +
  'Ecgo3LjFzBsS/lD/qOgkaopUuwAR8ra4WtUTP6AXwXz6sqccyIhhc/+gtxorrcMC\n' +
  'PJRcRgREMediFFy8sTNAcjx8zKWSu1r8oe7uAq0qenQwIrSHqd89mLyGxtMpQpVw\n' +
  'vNN0XF5VBuqegXgscrf4XzL6y3crqPiIiiXSDuNPIKQDNl5TMFlfil+nuXyB/KBE\n' +
  'tNt2JQIDAQABo3gwdjASBgNVHRMBAf8ECDAGAQH/AgEBMA4GA1UdDwEB/wQEAwIF\n' +
  'oDAnBgNVHSUEIDAeBggrBgEFBQcDAQYIKwYBBQUHAwIGCCsGAQUFBwMJMCcGA1Ud\n' +
  'EQQgMB6CC2V4YW1wbGUuY29tgg93d3cuZXhhbXBsZS5jb20wDQYJKoZIhvcNAQEL\n' +
  'BQADggEBABJPo/5h9fPPv2BPguxSFmneW4mnElyf6O4qCwUP0XKlI1a143AjV+2z\n' +
  'PW5YIZtIj7ztQaPOulrnpir0NrPbWHUN0H7ureN8o37efjkUBE6H3XgBXLvXZjY7\n' +
  'wbtPdJESQN96MG2kqtygy5BuyvqQLReJgzXRLmmAkK6SJBdn/12xSHBV1IsdPuX1\n' +
  'ObPjN+sPYFu/1kyCtA4pq1aV9k4zLbKAUsbTlaF+HNnZTHh7EnIVIsmoyUe1twLR\n' +
  'lRw9oxUBm2M4ZghVERjYsCWxGgsiCee8Y2qvyUrKDkYgdsGx1BvLD8FbRsqpRbwA\n' +
  '5LZKD4kN016u96dYCYnM+n9DeJAlbvk=\n'                                 +
  '-----END CERTIFICATE-----'

let caPemZh: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBlDCCATqgAwIBAgIUUx7GjuLeFC9f1yynoTZrpmYcKKYwCgYIKoZIzj0EAwIw\n' +
  'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
  'BAMMC1Jvb3QgQ0Eg5qC5MB4XDTI1MDQxNDExMTgzM1oXDTM1MDQxMjExMTgzM1ow\n' +
  'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
  'BAMMC1Jvb3QgQ0Eg5qC5MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE81102cdB\n' +
  'L08fkx5wxCG/mSQJdMu1xxpMGj2XUgenzbgYyHZ7ofe2YUTpWMjCIifhc4IVEZIN\n' +
  'UCleLn8xGa0x56MWMBQwEgYDVR0TAQH/BAgwBgEB/wIBAjAKBggqhkjOPQQDAgNI\n' +
  'ADBFAiEAolWYyEaFijGBI/SuEc6o4n7WUdkFjLRKTUJeSgdZhrcCIEU2J0TAqYyv\n' +
  'MGUzacduh8zp0BOC+65o9xcEhE3SQI10\n'                                 +
  '-----END CERTIFICATE-----'

let interPemZh: string =
    '-----BEGIN CERTIFICATE-----\n'                                      +
    'MIIBpDCCAUqgAwIBAgIUe8ZyZme9A2eMurr+FFMx1VMcsSAwCgYIKoZIzj0EAwIw\n' +
    'PjELMAkGA1UEBhMCQ04xGTAXBgNVBAoMEFJvb3QgQ0EgQ29ycCDmoLkxFDASBgNV\n' +
    'BAMMC1Jvb3QgQ0Eg5qC5MB4XDTI1MDQxNDExMTgzM1oXDTMwMDQxMzExMTgzM1ow\n' +
    'TjELMAkGA1UEBhMCQ04xITAfBgNVBAoMGEludGVybWVkaWF0ZSBDQSBDb3JwIOag\n' +
    'uTEcMBoGA1UEAwwTSW50ZXJtZWRpYXRlIENBIOaguTBZMBMGByqGSM49AgEGCCqG\n' +
    'SM49AwEHA0IABNQx7KpHpTNn3IH8RWJFovnhDOhunvCd3qwA+JnOlMb+uFlWR9+G\n' +
    'K2fVwBDK6SfWRshjXDRHNlgwyFwW/6MRER6jFjAUMBIGA1UdEwEB/wQIMAYBAf8C\n' +
    'AQEwCgYIKoZIzj0EAwIDSAAwRQIhAOVFcYNW+4YM7O3QkLRyJlewfdO7Qf2JhZUd\n' +
    '1VFnIBtiAiAE0WLkHU505yMAcBy82JrcPlJrz+RI/AaQVJggChDaNg==\n'         +
    '-----END CERTIFICATE-----'

let subPemZh: string =
    '-----BEGIN CERTIFICATE-----\n'                                      +
    'MIIB1TCCAXqgAwIBAgIUWtiIpmIHUuHgg/VbT4ZaL1XyhBEwCgYIKoZIzj0EAwIw\n' +
    'TjELMAkGA1UEBhMCQ04xITAfBgNVBAoMGEludGVybWVkaWF0ZSBDQSBDb3JwIOag\n' +
    'uTEcMBoGA1UEAwwTSW50ZXJtZWRpYXRlIENBIOaguTAeFw0yNTA0MTQxMTE4MzNa\n' +
    'Fw0yNjA0MTQxMTE4MzNaMHQxCzAJBgNVBAYTAkNOMRcwFQYDVQQIDA5CZWlqaW5n\n' +
    'IOWMl+S6rDEXMBUGA1UEBwwOQmVpamluZyDljJfkuqwxGTAXBgNVBAoMEEV4YW1w\n' +
    'bGUgQ29ycCDll6gxGDAWBgNVBAMMD2V4YW1wbGUuY29tIOS+izBZMBMGByqGSM49\n' +
    'AgEGCCqGSM49AwEHA0IABG8nx9wUfJRf6B6U2oCuF+8XLLON7xIBPSAYNJnL9BD8\n' +
    'BsWchcDiMiBVBZeLWq3Xm25hKuCvwM/NCNttixtC3FSjEDAOMAwGA1UdEwEB/wQC\n' +
    'MAAwCgYIKoZIzj0EAwIDSQAwRgIhALf2V8Fu8Da8fNi8q+Xs2nNagtohc7X6Uhkm\n' +
    'IGIoFO3xAiEA8kKITUqwI5TDSm18vb44sg2nm55WgYPZ6oIuchLq9mA=\n'         +
    '-----END CERTIFICATE-----'

let chainCrlPemZh: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIIBADCBpgIBATAKBggqhkjOPQQDAjBOMQswCQYDVQQGEwJDTjEhMB8GA1UECgwY\n' +
  'SW50ZXJtZWRpYXRlIENBIENvcnAg5qC5MRwwGgYDVQQDDBNJbnRlcm1lZGlhdGUg\n' +
  'Q0Eg5qC5Fw0yNTA0MTQxMTE4MzNaFw0yNTA1MTQxMTE4MzNaMCcwJQIUWtiIpmIH\n' +
  'UuHgg/VbT4ZaL1XyhBIXDTI1MDQxNDExMTgzM1owCgYIKoZIzj0EAwIDSQAwRgIh\n' +
  'AMIv/TgNlyuPeCzqOdEty2L5dj7dLr9MF99PgW8QcdTLAiEA8EkIaDXrkpI5I6dK\n' +
  'yT9WwWOIgtpEy+M+vfmuwe4x/qM=\n'                                     +
  '-----END X509 CRL-----'

let chainCrlPemEn: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIIBCTCBsAIBATAKBggqhkjOPQQDAjBYMQswCQYDVQQGEwJDTjEQMA4GA1UEBwwH\n' +
  'QmVpamluZzEdMBsGA1UECgwUSW50ZXJtZWRpYXRlIENBIENvcnAxGDAWBgNVBAMM\n' +
  'D0ludGVybWVkaWF0ZSBDQRcNMjUwNDE1MDY0NjExWhcNMjUwNTE1MDY0NjExWjAn\n' +
  'MCUCFD33zuzgd1ih1WclZoGPZAb/b5DWFw0yNTA0MTUwNjQ2MTFaMAoGCCqGSM49\n' +
  'BAMCA0gAMEUCIQC4KH6v+kJpSCsqmUSrMH5r9x/w9kmJf38gfvMTtk5jWgIgHfwv\n' +
  'LT2Q9FeUpivieU/NoL2wllQg7ST6IQQbuk4fn0g=\n'                         +
  '-----END X509 CRL-----'

let certNoSubjectPem: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBYTCCAQagAwIBAgIUWtiIpmIHUuHgg/VbT4ZaL1XyhBEwCgYIKoZIzj0EAwIw\n' +
  'TjELMAkGA1UEBhMCQ04xITAfBgNVBAoMGEludGVybWVkaWF0ZSBDQSBDb3JwIOag\n' +
  'uTEcMBoGA1UEAwwTSW50ZXJtZWRpYXRlIENBIOaguTAeFw0yNTA0MTQxMTE4MzNa\n' +
  'Fw0yNjA0MTQxMTE4MzNaMAAwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARvJ8fc\n' +
  'FHyUX+gelNqArhfvFyyzje8SAT0gGDSZy/QQ/AbFnIXA4jIgVQWXi1qt15tuYSrg\n' +
  'r8DPzQjbbYsbQtxUoxAwDjAMBgNVHRMBAf8EAjAAMAoGCCqGSM49BAMCA0kAMEYC\n' +
  'IQC39lfBbvA2vHzYvKvl7NpzWoLaIXO1+lIZJiBiKBTt8QIhAPJCiE1KsCOUw0pt\n' +
  'fL2+OLINp5ueVoGD2eqCLnIS6vZg\n'                                     +
  '-----END CERTIFICATE-----'

let certNoIssuerPem: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIBhzCCASygAwIBAgIUWtiIpmIHUuHgg/VbT4ZaL1XyhBEwCgYIKoZIzj0EAwIw\n' +
  'ADAeFw0yNTA0MTQxMTE4MzNaFw0yNjA0MTQxMTE4MzNaMHQxCzAJBgNVBAYTAkNO\n' +
  'MRcwFQYDVQQIDA5CZWlqaW5nIOWMl+S6rDEXMBUGA1UEBwwOQmVpamluZyDljJfk\n' +
  'uqwxGTAXBgNVBAoMEEV4YW1wbGUgQ29ycCDll6gxGDAWBgNVBAMMD2V4YW1wbGUu\n' +
  'Y29tIOS+izBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABG8nx9wUfJRf6B6U2oCu\n' +
  'F+8XLLON7xIBPSAYNJnL9BD8BsWchcDiMiBVBZeLWq3Xm25hKuCvwM/NCNttixtC\n' +
  '3FSjEDAOMAwGA1UdEwEB/wQCMAAwCgYIKoZIzj0EAwIDSQAwRgIhALf2V8Fu8Da8\n' +
  'fNi8q+Xs2nNagtohc7X6UhkmIGIoFO3xAiEA8kKITUqwI5TDSm18vb44sg2nm55W\n' +
  'gYPZ6oIuchLq9mA=\n'                                                 +
  '-----END CERTIFICATE-----'

// revoked crl and cert
let certCrlPemZh: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIIBQzCB6QIBATAKBggqhkjOPQQDAjCBkDELMAkGA1UEBhMCQ04xEDAOBgNVBAcM\n' +
  'B0JlaWppbmcxFTATBgNVBAcMDOS9oOWlvSBDaGluYTEXMBUGA1UEBwwO5L2g5aW9\n' +
  'IEJlaWppbmcxITAfBgNVBAoMGOWXqCBJbnRlcm1lZGlhdGUgQ0EgQ29ycDEcMBoG\n' +
  'A1UEAwwT5ZeoIEludGVybWVkaWF0ZSBDQRcNMjUwNDE1MDczNjEwWhcNMjUwNTE1\n' +
  'MDczNjEwWjAnMCUCFB761cq9lplO2kLDZ6DGWO/M1bUQFw0yNTA0MTUwNzM2MTBa\n' +
  'MAoGCCqGSM49BAMCA0kAMEYCIQCXeZBHaWfgYX+1+rCobt1Dnm9MhGnEhVLxnK+w\n' +
  'TIWwiQIhAMicXyOa1gyoyVJju9VP92jMKEv+wNmKYjGhrwfOqhYI\n'             +
  '-----END X509 CRL-----'

let certCrlPemEn: string =
  '-----BEGIN X509 CRL-----\n'                                         +
  'MIIBCDCBsAIBATAKBggqhkjOPQQDAjBYMQswCQYDVQQGEwJDTjEQMA4GA1UEBwwH\n' +
  'QmVpamluZzEdMBsGA1UECgwUSW50ZXJtZWRpYXRlIENBIENvcnAxGDAWBgNVBAMM\n' +
  'D0ludGVybWVkaWF0ZSBDQRcNMjUwNDE1MDczNjAxWhcNMjUwNTE1MDczNjAxWjAn\n' +
  'MCUCFGFCANvPepiLGRSBnUA7bqE2awITFw0yNTA0MTUwNzM2MDFaMAoGCCqGSM49\n' +
  'BAMCA0cAMEQCIAp8KtfmDPlh/g9vmF+z9b7g3mfbCJIY30ch+yAxOmXnAiAr9U1d\n' +
  '1jSToI8phWYNkDYHZMXq4H96kWKqCEQCzQ93Dw==\n'                         +
  '-----END X509 CRL-----'

let certCrlRevokedPemZh: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIICLjCCAdWgAwIBAgIUHvrVyr2WmU7aQsNnoMZY78zVtRAwCgYIKoZIzj0EAwIw\n' +
  'gZAxCzAJBgNVBAYTAkNOMRAwDgYDVQQHDAdCZWlqaW5nMRUwEwYDVQQHDAzkvaDl\n' +
  'pb0gQ2hpbmExFzAVBgNVBAcMDuS9oOWlvSBCZWlqaW5nMSEwHwYDVQQKDBjll6gg\n' +
  'SW50ZXJtZWRpYXRlIENBIENvcnAxHDAaBgNVBAMME+WXqCBJbnRlcm1lZGlhdGUg\n' +
  'Q0EwHhcNMjUwNDE1MDczNjEwWhcNMjYwNDE1MDczNjEwWjCBizELMAkGA1UEBhMC\n' +
  'Q04xFzAVBgNVBAgMDuS9oOWlvSBCZWlqaW5nMRUwEwYDVQQHDAzkvaDlpb0gQ2hp\n' +
  'bmExFzAVBgNVBAcMDuS9oOWlvSBCZWlqaW5nMRkwFwYDVQQKDBDll6ggRXhhbXBs\n' +
  'ZSBDb3JwMRgwFgYDVQQDDA/ll6ggZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggq\n' +
  'hkjOPQMBBwNCAARa015Ny3+bppiGXq36skLhNswA4w41jPQsePFBU/snChTySguZ\n' +
  'OiGAAW3QI5snw4RmXQ1tRKBi04GQUSJozKbXoxAwDjAMBgNVHRMBAf8EAjAAMAoG\n' +
  'CCqGSM49BAMCA0cAMEQCIB+ULJiAcTvmYEIwsvi9USkmCXNRArGkTWzIy+UF4DwE\n' +
  'AiAlhYFAoJwj/y/S2MKz291ZONGMUE4ueImSiCp7v3egQQ==\n'                 +
  '-----END CERTIFICATE-----'

let certCrlRevokedPemEn: string =
  '-----BEGIN CERTIFICATE-----\n'                                      +
  'MIIB2TCCAX6gAwIBAgIUYUIA2896mIsZFIGdQDtuoTZrAhMwCgYIKoZIzj0EAwIw\n' +
  'WDELMAkGA1UEBhMCQ04xEDAOBgNVBAcMB0JlaWppbmcxHTAbBgNVBAoMFEludGVy\n' +
  'bWVkaWF0ZSBDQSBDb3JwMRgwFgYDVQQDDA9JbnRlcm1lZGlhdGUgQ0EwHhcNMjUw\n' +
  'NDE1MDczNjAxWhcNMjYwNDE1MDczNjAxWjBuMQswCQYDVQQGEwJDTjEQMA4GA1UE\n' +
  'CAwHQmVpamluZzEOMAwGA1UEBwwFQ2hpbmExEDAOBgNVBAcMB0JlaWppbmcxFTAT\n' +
  'BgNVBAoMDEV4YW1wbGUgQ29ycDEUMBIGA1UEAwwLZXhhbXBsZS5jb20wWTATBgcq\n' +
  'hkjOPQIBBggqhkjOPQMBBwNCAAS7awvKIkB5jYdbL05We/LJ6FtUkh3LIv2KxCoc\n' +
  'iJ27IwuQy1Q36vY6IvlRITF2UvYA3u2ZGpwOYZiWtc7T5XFmoxAwDjAMBgNVHRMB\n' +
  'Af8EAjAAMAoGCCqGSM49BAMCA0kAMEYCIQCtH8WbbUAiZKY4b5XvbX4IbinOMyIZ\n' +
  'vk/jYbtzqmrcWAIhALEme7+7MF6uUIOMRzZ9+y+AwMeBF1H+AUaGn/9+9+GV\n'     +
  '-----END CERTIFICATE-----'

async function createX509Cert(inStream: string): Promise<cert.X509Cert> {
  let encodingBlob: cert.EncodingBlob = {
    data: stringTouInt8Array(inStream),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM

  };
  let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);

  return x509Cert;
}

async function getRevokedCerts(crl: cert.X509CRL): Promise<cert.X509CRLEntry[]> {
  return new Promise((resolve, reject) => {
    crl.getRevokedCerts((err, crlEntries) => {
      if (err) {
        reject(err);
      } else {
        resolve(crlEntries);
      }
    });
  });
}


export {
  certPemZh,
  certPemEn,
  certPemMultipleCNZh,
  DNZh,
  DNEn,
  chainPemZh,
  certErrorCNPem,
  caPemZh,
  interPemZh,
  subPemZh,
  chainCrlPemZh,
  chainCrlPemEn,
  createX509Cert,
  certNoSubjectPem,
  certNoIssuerPem,
  certCrlPemZh,
  certCrlPemEn,
  certCrlRevokedPemZh,
  certCrlRevokedPemEn,
  getRevokedCerts
}