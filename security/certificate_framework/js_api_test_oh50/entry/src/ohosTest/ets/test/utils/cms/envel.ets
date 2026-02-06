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
import { cert } from "@kit.DeviceCertificateKit";

export let CMS_SYM_CIPHER: cert.CmsRecipientEncryptionAlgorithm[] = [
  cert.CmsRecipientEncryptionAlgorithm.AES_128_CBC,
  cert.CmsRecipientEncryptionAlgorithm.AES_192_CBC,
  cert.CmsRecipientEncryptionAlgorithm.AES_256_CBC,
  cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM,
  cert.CmsRecipientEncryptionAlgorithm.AES_192_GCM,
  cert.CmsRecipientEncryptionAlgorithm.AES_256_GCM
];

export let CMS_DIGEST: cert.CmsKeyAgreeRecipientDigestAlgorithm[] = [
  cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256,
  cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384,
  cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA512
];

export let CMS_RSA_PADDING: cert.CmsRsaSignaturePadding[] = [
  cert.CmsRsaSignaturePadding.PKCS1_PADDING,
  cert.CmsRsaSignaturePadding.PKCS1_PSS_PADDING
];

/* ECC DATA */
export let ECC_256_PRIVATE2: string =
  "-----BEGIN EC PRIVATE KEY-----\n"                                   +
  "MHcCAQEEIJJk8xinqG9t8K7ghm/muz5mqUw2EY2wjUF8evBAvrsOoAoGCCqGSM49\n" +
  "AwEHoUQDQgAERY2tTM9SUy5470jolRKN9YJ42c4kYY5D5hETCuWZy3W1B6YTS22G\n" +
  "tUF7hqGMvQ9yozkPRAVQPh9BUxJIyHRKjw==\n"                             +
  "-----END EC PRIVATE KEY-----";

export let ECC_256_PRIVATE: string =
  "-----BEGIN PRIVATE KEY-----\n"                                      +
  "MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgOYwEyIw3ZNIAL4xO\n" +
  "pP6eVcQYcrL2sfnt6vB0z9tKmMmhRANCAAQHTqHhLM6vKLd3s9b3I3bAAIJXGV24\n" +
  "FCNUtZmUMqEUqR1mO97yZTLK1JJsGP+uvNHZebNTOh+42RRsC2N7cMMm\n"         +
  "-----END PRIVATE KEY-----";
/* pass 123456 */
export let ECC_256_PRIVATE_ENC: string =
  "-----BEGIN ENCRYPTED PRIVATE KEY-----\n"                            +
  "MIHsMFcGCSqGSIb3DQEFDTBKMCkGCSqGSIb3DQEFDDAcBAj+49OshHTCoQICCAAw\n" +
  "DAYIKoZIhvcNAgkFADAdBglghkgBZQMEAQIEEA6SZBqRJA0Fj3gCkz/0hGkEgZCl\n" +
  "g7QxK50jMA4w8YAF+PG8nM9CYWvREXcRz++isX/Ctlm6VrfMime5dGah44OwZ7T4\n" +
  "wrXnQYfkN4PA2IHDe33gLSAoiiu/XOhbpN2Bx1jgbNFkHo8od2h1p7rH3OXaosoT\n" +
  "MLismsbSWFttaNvquJKBANw8ahUBv4T2Kb+BGRVF+TMoJKhp6EvaJ0RyRh+6Qho=\n" +
  "-----END ENCRYPTED PRIVATE KEY-----";

export let ECC_256_PUBKEY: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICGDCCAb6gAwIBAgIGAXKnJjrAMAoGCCqGSM49BAMCMFcxCzAJBgNVBAYTAkNO\n" +
  "MQ8wDQYDVQQIDAbpmZXopb8xDzANBgNVBAcMBuilv+WuiTEPMA0GA1UECgwG5rWL\n" +
  "6K+VMRUwEwYDVQQDDAzkuK3mlofmtYvor5UwHhcNMjUwOTE2MDY0MTMwWhcNMzUw\n" +
  "OTE0MDY0MTMwWjBXMQswCQYDVQQGEwJDTjEPMA0GA1UECAwG6ZmV6KW/MQ8wDQYD\n" +
  "VQQHDAbopb/lrokxDzANBgNVBAoMBua1i+ivlTEVMBMGA1UEAwwM5Lit5paH5rWL\n" +
  "6K+VMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEB06h4SzOryi3d7PW9yN2wACC\n" +
  "VxlduBQjVLWZlDKhFKkdZjve8mUyytSSbBj/rrzR2XmzUzofuNkUbAtje3DDJqN2\n" +
  "MHQwHQYDVR0OBBYEFNtUldgBESf31bwTnYtApIctaSdtMB8GA1UdIwQYMBaAFNtU\n" +
  "ldgBESf31bwTnYtApIctaSdtMAsGA1UdDwQEAwIBBjAJBgNVHREEAjAAMAkGA1Ud\n" +
  "EgQCMAAwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNIADBFAiEAzxzaG2vR\n" +
  "zUnFFL3X3lRQ0IOJrb6cvkSZuaFd4bW2lgUCIHW6QGGnECDFMbDNz7Og9kjkt+3k\n" +
  "FmEJWqEMYudBH3Ul\n"                                                 +
  "-----END CERTIFICATE-----";

export let RSA_PRIVATE: string =
  "-----BEGIN PRIVATE KEY-----\n"                                      +
  "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAKkG7VuJIvvtveed\n" +
  "fDhVit6t1Ke2mCdtxmm8tTsEr1KMCDhGph15fOJD3/eMs2qkGMCXmdpRKxvNWGeQ\n" +
  "n6p8NxzTkOGt7y4XjjCQotfWc4qqtHPAVDHcmhDnkxYeY5/b1PDqs5hw/lcFWxMV\n" +
  "z+s1CqGvwbp1zXtYo8rh1bQlSQYBAgMBAAECgYEAmAU572zMwSbW+PyEX6pYJuTS\n" +
  "8TBhcnzhyfHGUdlp0eVN80dfWf0NG/eN9Phf2ZbTCEyRPHBqRCwQybyiTdRAP7+8\n" +
  "2e6n3/VHgJCmMV5oZKMChPv9OOE8EGlRwKeQemHK4eSVbCirDGKanE54vpTPW0ic\n" +
  "m33ULA+DTI2Fsv7Ey60CQQDRN+HaySheKXJtYhvSjasswx5kzBS/Xy+c0cOsfZIQ\n" +
  "3ecVD7cG1kwqqGUFBRFKB8ETAH8H9gCht92ZMRPgsKMDAkEAztJo9B5RuY1el2mI\n" +
  "wAT5bXxYeCpWHLESkE96j710Pi8dVDvYWrqB126SEs2VNxdKOKCs26ShQMA1SkQt\n" +
  "3dhhqwJBAI1rM5xaupGjfHhZh6r0Hc98+G9zz1ZoNdvPom9W1cPW6ts+qx3Q/t0a\n" +
  "xGX3Pe+HfEem3zb3XwfxK7XgCaqoWxcCQQCID/7CEyw6wRlozSINCXi6oaJmM5wB\n" +
  "NjD7RX5hEAdoXYCTCOf2EFsZSoHI4vz2iFjo1jPCMBVxzsGAQUhXeWIPAkB+lF0u\n" +
  "NO/1fXKq6Z6NtpZmMfPBBNNgv24ZIdxbDvqQELxi6K1VnSSuXPj6Pohk4rpldMNj\n" +
  "OdFU0vNQLVdyrfnB\n"                                                 +
  "-----END PRIVATE KEY-----";

export let RSA_PUBKEY: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICgTCCAeqgAwIBAgIGAXKnJjrEMA0GCSqGSIb3DQEBCwUAMEgxCzAJBgNVBAYT\n" +
  "AkNOMQswCQYDVQQIDAJTWDEOMAwGA1UEBwwFeGkgYW4xDTALBgNVBAoMBFRlc3Qx\n" +
  "DTALBgNVBAMMBHRlc3QwHhcNMjUwOTIwMDgyODEwWhcNMzUwOTE4MDgyODEwWjBI\n" +
  "MQswCQYDVQQGEwJDTjELMAkGA1UECAwCU1gxDjAMBgNVBAcMBXhpIGFuMQ0wCwYD\n" +
  "VQQKDARUZXN0MQ0wCwYDVQQDDAR0ZXN0MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB\n" +
  "iQKBgQCpBu1biSL77b3nnXw4VYrerdSntpgnbcZpvLU7BK9SjAg4RqYdeXziQ9/3\n" +
  "jLNqpBjAl5naUSsbzVhnkJ+qfDcc05Dhre8uF44wkKLX1nOKqrRzwFQx3JoQ55MW\n" +
  "HmOf29Tw6rOYcP5XBVsTFc/rNQqhr8G6dc17WKPK4dW0JUkGAQIDAQABo3YwdDAd\n" +
  "BgNVHQ4EFgQUJLVJ0Ittnbhv0cFf1vsgW2uIb10wHwYDVR0jBBgwFoAUJLVJ0Itt\n" +
  "nbhv0cFf1vsgW2uIb10wCwYDVR0PBAQDAgEGMAkGA1UdEQQCMAAwCQYDVR0SBAIw\n" +
  "ADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4GBACL9kimmqI6uEoxD\n" +
  "K1eyCnSYBCZB/V46K2RolCaic0YCb41bf/F5N9KmCAInZtoRUqDC+QqZNS73nmgQ\n" +
  "gLwREwsVVfwXvNne+GDW9jRWK/2/fEeqSqdFlfEgaoHRanIPtnF/IL/xFxZFm5dv\n" +
  "P24GY74ilN/mQ11DS6pbesLNuXg/\n"                                     +
  "-----END CERTIFICATE-----";

export let CMS_KEK_DETACHED_DATA: string =
  "-----BEGIN CMS-----\n" +
  "MIIEEAYLKoZIhvcNAQkQARegggP/MIID+wIBADGCA7UwgekCAQAwUjBIMQswCQYD\n" +
  "VQQGEwJDTjELMAkGA1UECAwCU1gxDjAMBgNVBAcMBXhpIGFuMQ0wCwYDVQQKDARU\n" +
  "ZXN0MQ0wCwYDVQQDDAR0ZXN0AgYBcqcmOsQwDQYJKoZIhvcNAQEBBQAEgYB0GLyg\n" +
  "2NQpFX00ogBJ2dcavLQMWb3pxBbgozh4thF0N7hozsYFojQdhg9qE1qxzQ6AvZ2j\n" +
  "c50kv18VJuwPDw8VPDNjYTLxVPLLZ8QzZ5F4s08Dh+07NyVnayZUzXxeYvdAq1UM\n" +
  "B/K8PcKDnb+jYff+AVq2JXXHHd3te9CseGsF3qGCAQMCAQOgUaFPMAkGByqGSM49\n" +
  "AgEDQgAEXHc99yAAvePMMEgevXARAAX7Z+5cjR412XoXUi72J7mqm5GEeLbHHFPl\n" +
  "Z9lp0cgPQAaMeYSjxh15OHKkoLrWwDAYBgkrgQUQhkg/AAIwCwYJYIZIAWUDBAEt\n" +
  "MIGQMIGNMGEwVzELMAkGA1UEBhMCQ04xDzANBgNVBAgMBumZleilvzEPMA0GA1UE\n" +
  "BwwG6KW/5a6JMQ8wDQYDVQQKDAbmtYvor5UxFTATBgNVBAMMDOS4reaWh+a1i+iv\n" +
  "lQIGAXKnJjrABCgce8URxDn6+t9etIEcx46n+Cdi3jDPMYaDGl3cs/UHRBeCLMgc\n" +
  "8s6ioYIBvgIBA6CCARihggEUMAkGByqGSM4+AgEDggEFAAKCAQBkm4C0CSzghJpo\n" +
  "sG7nD0GS8dq7MqtrNY1OCJEu+V2eilRi5diZXITVO+OAqTruBVHDE6rf9xsVc7d3\n" +
  "MAu1Wq8It0TpRtWY0aJ8bp7QNaxwtWIIcApI1ZWW/ieJ/T+7w+xbCp0a/VGBKBkf\n" +
  "XaUuDG0VJd27DUCiZJ+GBB/vAQLoq7QfxDMOI/iZIRJHzws2Gq/TFoKmJYvQbrSV\n" +
  "Q80qfY4TOQ/JPD85a7uJ20XYrz+RgeqVeZvndHnhhUQxWkj4cRt9U+cKhB/t+zDx\n" +
  "HyN0NdzNED4+GC9DUZ+cTUd0rOZHXiDt+ePfb68hqPTT/fhWB8ViviFrKGnBW0mk\n" +
  "TJl2/Y/bMBoGCyqGSIb3DQEJEAMFMAsGCWCGSAFlAwQBLTCBgDB+MFIwSDELMAkG\n" +
  "A1UEBhMCQ04xCzAJBgNVBAgMAlNYMQ4wDAYDVQQHDAV4aSBhbjENMAsGA1UECgwE\n" +
  "VGVzdDENMAsGA1UEAwwEdGVzdAIGAXKnJjrFBCjwUBr8ske7Kv8qVVm25j6+GNop\n" +
  "lw4WTOPBVNgS3B+iVOrPMqEtRN5DMCsGCSqGSIb3DQEHATAeBglghkgBZQMEAS4w\n" +
  "EQQMjrQWPtxQ5f2JnxQpAgEQBBCV7tyULviZqnEqBWyB1iXu\n" +
  "-----END CMS-----";

// cipherText: 1f 36 55 95
export let CMS_ONLY_KEK_DETACHED_DATA: string =
  "-----BEGIN CMS-----\n" +
  "MIGnBgsqhkiG9w0BCRABF6CBlzCBlAIBADFQok4CAQQwEgQQMTIzNDU2Nzg5MGFi\n" +
  "Y2RlZjALBglghkgBZQMEAS0EKDVc+Ss8CTjN1X1k1u9gosWeIZCCJwpDFAXdU11G\n" +
  "FzK+zRrReBaj43wwKwYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAxushSJIz0w\n" +
  "5Imn2DACARAEEHPQoPoapCqy7AwqqMQTZOA=\n" +
  "-----END CMS-----";

export let CMS_ONLY_KEK_ATTACHED_DATA: string =
  "-----BEGIN CMS-----\n" +
  "MIGtBgsqhkiG9w0BCRABF6CBnTCBmgIBADFQok4CAQQwEgQQMTIzNDU2Nzg5MGFi\n" +
  "Y2RlZjALBglghkgBZQMEAS0EKNV1fm0MO0E1/H1kk7BCR2v2gKjsYscAW2KGMHDl\n" +
  "hHNG7xPO0Tcw4tgwMQYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAywmBqU/anN\n" +
  "EZoDFSwCARCABLk/jUwEEO/dvRaXoUXoP9CMVKyk0SE=\n" +
  "-----END CMS-----";

export let CMS_DATA: string =
  "-----BEGIN CMS-----\n" +
  "MIIBSwYLKoZIhvcNAQkQARegggE6MIIBNgIBADGB8aGB7gIBA6BRoU8wCQYHKoZI\n" +
  "zj0CAQNCAASzqVn7O2zw/oxLiKyTPROjekfsStvKnIprrS86sAnvWs/1RfoE87cY\n" +
  "s+7uUcgG1U55n0jyp1mTwKUKRGXvPiKvMBUGBiuBBAELATALBglghkgBZQMEAQUw\n" +
  "fzB9MGEwVzELMAkGA1UEBhMCQ04xDzANBgNVBAgMBumZleilvzEPMA0GA1UEBwwG\n" +
  "6KW/5a6JMQ8wDQYDVQQKDAbmtYvor5UxFTATBgNVBAMMDOS4reaWh+a1i+ivlQIG\n" +
  "AXKnJjrABBiGOFvlfkb4OKegab4fZToY88UjwiTpXN4wKwYJKoZIhvcNAQcBMB4G\n" +
  "CWCGSAFlAwQBBjARBAzNut4BFBrKgPmOsioCARAEEE/W87JLt45l7wbPRPH9oaU=\n" +
  "-----END CMS-----";

type T = cert.CmsRecipientEncryptionAlgorithm | cert.CmsKeyAgreeRecipientDigestAlgorithm;

export interface Params {
  priKey: string | Uint8Array,
  encPriKey: string | Uint8Array,
  pubKey: string | Uint8Array,
  pubCert: string | Uint8Array,
}

export interface ECC {
  ECC224?: Params,
  ECC256?: Params,
  ECC384?: Params,
  ECC521?: Params
}




