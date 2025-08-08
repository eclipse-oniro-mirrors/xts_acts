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

let rootCaCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBgzCCASqgAwIBAgIUeWln0fIsaUBsYjr7iVYc9E8EZLQwCgYIKoZIzj0EAwIw\n" +
  "NjELMAkGA1UEBhMCQ04xFTATBgNVBAoMDFJvb3QgQ0EgQ29ycDEQMA4GA1UEAwwH\n" +
  "Um9vdCBDQTAeFw0yNTA3MDkwMjU3MzFaFw0zNTA3MDcwMjU3MzFaMDYxCzAJBgNV\n" +
  "BAYTAkNOMRUwEwYDVQQKDAxSb290IENBIENvcnAxEDAOBgNVBAMMB1Jvb3QgQ0Ew\n" +
  "WTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAATBGJF/0Q92U/lKky5REBxi4gfzdCRm\n" +
  "vM9slQllInC7rSTZ82aHQS3I+aM/AHxuASG0/ngJ6gDrh08bqiSrrcVMoxYwFDAS\n" +
  "BgNVHRMBAf8ECDAGAQH/AgECMAoGCCqGSM49BAMCA0cAMEQCIGZOS2JreLWL8C3D\n" +
  "atcJO21la1FHJq/xhXl43KeWh3NzAiBd7VlaZz/MgvJuOmb2aAJ7h6qDnRi9lnov\n" +
  "d3QUTjhPxQ==\n" +
  "-----END CERTIFICATE-----";

let intermediateCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBlDCCATqgAwIBAgIUA99aBUhGq2qEwcUuWQEXw0xAxg0wCgYIKoZIzj0EAwIw\n" +
  "NjELMAkGA1UEBhMCQ04xFTATBgNVBAoMDFJvb3QgQ0EgQ29ycDEQMA4GA1UEAwwH\n" +
  "Um9vdCBDQTAeFw0yNTA3MDkwMjU3MzFaFw0zMDA3MDgwMjU3MzFaMEYxCzAJBgNV\n" +
  "BAYTAkNOMR0wGwYDVQQKDBRJbnRlcm1lZGlhdGUgQ0EgQ29ycDEYMBYGA1UEAwwP\n" +
  "SW50ZXJtZWRpYXRlIENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEScG4sRlO\n" +
  "pdbudXHxmVxf2Y3NrcOHOCKzVSfB1w5ICq8/rpVhgmNv0WZMtWG30LU3CLhAvjwW\n" +
  "zDcQObDH+goU/KMWMBQwEgYDVR0TAQH/BAgwBgEB/wIBATAKBggqhkjOPQQDAgNI\n" +
  "ADBFAiEAhzce8B/FAcAb4vj6oRzNGFg9scZxRHZOb8sd/Tpqt0ACIEG9FpD7G8YM\n" +
  "X26xrcJ3IaTLm6GaqTVb102ioI/tHWjg\n" +
  "-----END CERTIFICATE-----";

let endEntityCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBtjCCAVygAwIBAgIUPH5XfAGMAbQlu4c2WuLqvbjmbh4wCgYIKoZIzj0EAwIw\n" +
  "RjELMAkGA1UEBhMCQ04xHTAbBgNVBAoMFEludGVybWVkaWF0ZSBDQSBDb3JwMRgw\n" +
  "FgYDVQQDDA9JbnRlcm1lZGlhdGUgQ0EwHhcNMjUwNzA5MDI1NzMxWhcNMjYwNzA5\n" +
  "MDI1NzMxWjBeMQswCQYDVQQGEwJDTjEQMA4GA1UECAwHQmVpamluZzEQMA4GA1UE\n" +
  "BwwHQmVpamluZzEVMBMGA1UECgwMRXhhbXBsZSBDb3JwMRQwEgYDVQQDDAtleGFt\n" +
  "cGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABFC8cHZ1wT8nGNxk9ASe\n" +
  "3Q4R4CGKx1oOC9jsiXM1KNC4Sl9iupjle8oudHzhmQIHZ82v8yjTdprs6YLfIrzU\n" +
  "iAujEDAOMAwGA1UdEwEB/wQCMAAwCgYIKoZIzj0EAwIDSAAwRQIgDQFl5Nyc1PcK\n" +
  "F/Mcdv7GWjvtLopXj2ZdwLO0pCuYjCICIQCtOKUhh5CdqbU1nHMnl2Hs2jfsRj0x\n" +
  "lOzs207cggjKyw==\n" +
  "-----END CERTIFICATE-----";

let otherRootCaCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBhTCCASqgAwIBAgIUUdVOBxxBM57jDgNHVkOoM5oMcd0wCgYIKoZIzj0EAwIw\n" +
  "NjELMAkGA1UEBhMCQ04xFTATBgNVBAoMDFJvb3QgQ0EgQ2VydDEQMA4GA1UEAwwH\n" +
  "Um9vdC1DQTAeFw0yNTA3MDkwNzE0MDZaFw0zNTA3MDcwNzE0MDZaMDYxCzAJBgNV\n" +
  "BAYTAkNOMRUwEwYDVQQKDAxSb290IENBIENlcnQxEDAOBgNVBAMMB1Jvb3QtQ0Ew\n" +
  "WTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARhRrqI7SobhouT4jn+xVW1gScX+/7h\n" +
  "mQij06XNwVbU//psqA92W5Rtc4FHIaohqv0Se77PjhZtksU418KZlfwnoxYwFDAS\n" +
  "BgNVHRMBAf8ECDAGAQH/AgECMAoGCCqGSM49BAMCA0kAMEYCIQDFgL1xTOqfLafO\n" +
  "R7N8p4afFbpWJ0cQ1i5UdIf67L/PXwIhAMYrBbmLv1HUK6KYwZNbHjaG0EIlB4mb\n" +
  "/pA1Pp3v83Te\n" +
  "-----END CERTIFICATE-----";

let otherIntermediateCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBlDCCATqgAwIBAgIUGHU8Oq6L5kuNWD8funHL3tJIue8wCgYIKoZIzj0EAwIw\n" +
  "NjELMAkGA1UEBhMCQ04xFTATBgNVBAoMDFJvb3QgQ0EgQ2VydDEQMA4GA1UEAwwH\n" +
  "Um9vdC1DQTAeFw0yNTA3MDkwNzE0MDZaFw0zMDA3MDgwNzE0MDZaMEYxCzAJBgNV\n" +
  "BAYTAkNOMR0wGwYDVQQKDBRJbnRlcm1lZGlhdGUgQ0EgQ2VydDEYMBYGA1UEAwwP\n" +
  "SW50ZXJtZWRpYXRlLUNBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEev0ZnVVS\n" +
  "uMEU6aUzxA73RTA4NTXuwV/RpRIp3LZn8ZENSjMGkNXQTu837daA+8aIZIhLUndY\n" +
  "VFl8vw21lo9EkaMWMBQwEgYDVR0TAQH/BAgwBgEB/wIBATAKBggqhkjOPQQDAgNI\n" +
  "ADBFAiEA3FnkIyqjfLg9IavKvEILRQAAL102koElk+RtFNBVlJUCIH5SsTn0F9My\n" +
  "WPb4fSd76S+K/JlvPBLnz6J6kGH9HAw1\n" +
  "-----END CERTIFICATE-----";

let otherEndEntityCert: string =
  "-----BEGIN CERTIFICATE-----\n" +
  "MIIBpjCCAUygAwIBAgIUZERWmWlroLDa4iNN/wpZEiq2GZowCgYIKoZIzj0EAwIw\n" +
  "RjELMAkGA1UEBhMCQ04xHTAbBgNVBAoMFEludGVybWVkaWF0ZSBDQSBDZXJ0MRgw\n" +
  "FgYDVQQDDA9JbnRlcm1lZGlhdGUtQ0EwHhcNMjUwNzA5MDcxNDA2WhcNMjYwNzA5\n" +
  "MDcxNDA2WjBOMQswCQYDVQQGEwJDTjENMAsGA1UECAwEWGlBbjENMAsGA1UEBwwE\n" +
  "WGlBbjENMAsGA1UECgwEVGVzdDESMBAGA1UEAwwJaGVsbG8uY29tMFkwEwYHKoZI\n" +
  "zj0CAQYIKoZIzj0DAQcDQgAEjH9EQSlswQmOWyuKyH8lzpz5vTHf8OZTllB0EKOP\n" +
  "y6TThy+MbSpfoeF3EksTgiV1udbE2aNgYsnCIrwVM3AikKMQMA4wDAYDVR0TAQH/\n" +
  "BAIwADAKBggqhkjOPQQDAgNIADBFAiAWr3yiiwedJFEs3uLE47GjSHVw4aXCjS+L\n" +
  "NslFuiYE6QIhAOuxl7Nz7H1jREm5bm0NIq9aT2XxLK9DCdT9xkrXx2bE\n" +
  "-----END CERTIFICATE-----";

let rootChainPem: string = endEntityCert + "\n" + intermediateCert + "\n" + rootCaCert;
let otherRootChainPem: string = otherEndEntityCert + "\n" + otherIntermediateCert + "\n" + otherRootCaCert;


export {
  rootCaCert,
  intermediateCert,
  endEntityCert,
  rootChainPem,
  otherRootCaCert,
  otherIntermediateCert,
  otherEndEntityCert,
  otherRootChainPem
}