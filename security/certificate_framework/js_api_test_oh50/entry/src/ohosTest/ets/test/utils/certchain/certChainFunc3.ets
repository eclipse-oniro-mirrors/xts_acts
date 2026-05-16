
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

import cert from '@ohos.security.cert';
import { BusinessError } from '@ohos.base';
import { X509TrustAnchor, RevocationCheckParameter } from './commonType3';

// string转Uint8Array
function stringToUint8Array(str: string): Uint8Array {
  let arr: Array<number> = [];
  for (let i = 0, j = str.length; i < j; i++) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

async function createX509CertChain1(): Promise<cert.X509CertChain> {
  let certChainData = '-----BEGIN CERTIFICATE-----\n' +
    'MIIGVjCCBT6gAwIBAgIQBMO0W3CU9LWVw1bE/jqYojANBgkqhkiG9w0BAQsFADBE\n' +
    'MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMR4wHAYDVQQDExVH\n' +
    'ZW9UcnVzdCBSU0EgQ04gQ0EgRzIwHhcNMjMwMzIzMDAwMDAwWhcNMjQwNDIyMjM1\n' +
    'OTU5WjB1MQswCQYDVQQGEwJDTjERMA8GA1UECBMIemhlamlhbmcxETAPBgNVBAcT\n' +
    'CGhhbmd6aG91MSwwKgYDVQQKEyNOZXRFYXNlIChIYW5nemhvdSkgTmV0d29yayBD\n' +
    'by4sIEx0ZDESMBAGA1UEAwwJKi4xNjMuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC\n' +
    'AQ8AMIIBCgKCAQEAwELks0Q1Z81u1OpbGdEFE2Snm/WpLfmiC5YFj5nFrinSX+UZ\n' +
    'MIk42euBdjYSsWFxbljmWDdUCjstMhG8vRAjz3Nt1QniMCunHHFGujR5rSNLWYHE\n' +
    'vCPhfptIhqOaE/rvkWGZZr2KjTQQN0dRf8dm9Oewy8DHu95c9jW6c9AVgKWUVOni\n' +
    'tTOcJCnrndWjgCIPfKmKgrwaNaMnuQyy5nPIUHl/5EGzuGHrwjwlF+w+cT+Fwdix\n' +
    'C3msEOCwX6wzo6baDs4og2EzuPNyTp4n4UqH5aHhLePgBFboOAyJwWp3+XJNpNGw\n' +
    'GkU56cUUy7+AAn268EVvUNr7uQ65t2t+Ys32bQIDAQABo4IDETCCAw0wHwYDVR0j\n' +
    'BBgwFoAUJG+RP4mHhw4ywkAY38VM60/ISTIwHQYDVR0OBBYEFD1HyRYJ5jqkvYL7\n' +
    'C6TSt8/y3e7hMB0GA1UdEQQWMBSCCSouMTYzLmNvbYIHMTYzLmNvbTAOBgNVHQ8B\n' +
    'Af8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMD0GA1UdHwQ2\n' +
    'MDQwMqAwoC6GLGh0dHA6Ly9jcmwuZGlnaWNlcnQuY24vR2VvVHJ1c3RSU0FDTkNB\n' +
    'RzIuY3JsMD4GA1UdIAQ3MDUwMwYGZ4EMAQICMCkwJwYIKwYBBQUHAgEWG2h0dHA6\n' +
    'Ly93d3cuZGlnaWNlcnQuY29tL0NQUzBxBggrBgEFBQcBAQRlMGMwIwYIKwYBBQUH\n' +
    'MAGGF2h0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNuMDwGCCsGAQUFBzAChjBodHRwOi8v\n' +
    'Y2FjZXJ0cy5kaWdpY2VydC5jbi9HZW9UcnVzdFJTQUNOQ0FHMi5jcnQwCQYDVR0T\n' +
    'BAIwADCCAX4GCisGAQQB1nkCBAIEggFuBIIBagFoAHUA7s3QZNXbGs7FXLedtM0T\n' +
    'ojKHRny87N7DUUhZRnEftZsAAAGHDSE15QAABAMARjBEAiBRpmsJ3F9AI8wFxqOQ\n' +
    'bHp+RL6F8cvNydajQ0Bqxjvd3AIgefAU/po3jBm+96dFVdbX+AG1uss67DL3VL5I\n' +
    'nUmVva8AdgBz2Z6JG0yWeKAgfUed5rLGHNBRXnEZKoxrgBB6wXdytQAAAYcNITZS\n' +
    'AAAEAwBHMEUCID/sUP12odF7uTTEyE0PjCpKo3nF7A3ba3b5wJJsZrDrAiEAxrat\n' +
    'W2eeZTD458LPSPrMMBb1/o6zibWXqJCQye+bVFwAdwBIsONr2qZHNA/lagL6nTDr\n' +
    'HFIBy1bdLIHZu7+rOdiEcwAAAYcNITYeAAAEAwBIMEYCIQCCJ2ktM1F+d1I5mQju\n' +
    'Tn7oDYxy3GCGyG3u/yhu8k7EaAIhANSP8cAaMQFV6y8B2tubKY5eSQtgkF3a6NNq\n' +
    'QJjtPnoHMA0GCSqGSIb3DQEBCwUAA4IBAQC8dK/G4nvs/SyQe/mnK+rUYIdSFs+4\n' +
    'lgzatmq8V/I1tBly+Sv/FPhnn4F3iCrqy9j8y202FP51ev95DGbjlJRTIFPqVAO8\n' +
    'ywYrLhvl1SJhV0b/8NF0Pr3dZVnK5Vfn11+LSBUg0cBB2hcVV30nv3IuVhz3d12n\n' +
    'P+VseYQgMpQf7ad+ttpZtA7yqHzrUm4fzr03G7q88GztACRSHoYiPbOlz99SeTgW\n' +
    '7bzZl1I4taxy2Q3b0ZBGfUt/kPY05tpKzKwDTbbqSErYszCt5X1RfVvf3coxF8Mo\n' +
    '9bHbs2wYIzQBdujDQ/hU0u6ItERer3SUItZoxaSIxdrZ9eXFwVvXsT/g\n' +
    '-----END CERTIFICATE-----\n' +
    '-----BEGIN CERTIFICATE-----\n' +
    'MIIFDzCCA/egAwIBAgIQCxNitu5qnT6WiTDxbiB9OTANBgkqhkiG9w0BAQsFADBh\n' +
    'MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3\n' +
    'd3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD\n' +
    'QTAeFw0yMDAzMDQxMjA0NDBaFw0zMDAzMDQxMjA0NDBaMEQxCzAJBgNVBAYTAlVT\n' +
    'MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxHjAcBgNVBAMTFUdlb1RydXN0IFJTQSBD\n' +
    'TiBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANA1OZJJtZUI\n' +
    '7zj4qFHT79g+Otks4TEfmUEDhrNKBEEjb/i29GBfnpvFdT36azCg2VODJRSjIzFn\n' +
    '4qADcc84EmfKiDEM97HFsQPp9RRkqxH5cB51EU2eBE9Ua95x+wQp/KSdCqITCQ/v\n' +
    'yvm3J4Upjl0wlW8wRCPCWcYw3pKClGRkNzVtI1KXnfpn7fG3N84n7wlBb9IGKJFa\n' +
    'c/6+hxvZx2qnfLsxdIKR0Q/biGoU6Z8Iy/R/p7GoPO8vamV090+QHEL5AdSzKtEh\n' +
    'U9vdvcuWjjLxVnaJLfj/6WoGZj8UWn3zFbEoTVaAfp2xqdzW7yRvi2r148m9ev7l\n' +
    'jDqHo8UX69sCAwEAAaOCAd4wggHaMB0GA1UdDgQWBBQkb5E/iYeHDjLCQBjfxUzr\n' +
    'T8hJMjAfBgNVHSMEGDAWgBQD3lA1VtFMu2bwo+IbG8OXsj3RVTAOBgNVHQ8BAf8E\n' +
    'BAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMBIGA1UdEwEB/wQI\n' +
    'MAYBAf8CAQAwMwYIKwYBBQUHAQEEJzAlMCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz\n' +
    'cC5kaWdpY2VydC5jbjBABgNVHR8EOTA3MDWgM6Axhi9odHRwOi8vY3JsLmRpZ2lj\n' +
    'ZXJ0LmNuL0RpZ2lDZXJ0R2xvYmFsUm9vdENBLmNybDCB3QYDVR0gBIHVMIHSMIHF\n' +
    'BglghkgBhv1sAQEwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0\n' +
    'LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZp\n' +
    'Y2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5\n' +
    'IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9y\n' +
    'cGEtdWEwCAYGZ4EMAQICMA0GCSqGSIb3DQEBCwUAA4IBAQCzkcXq0TN0oSn4UeXp\n' +
    'FBW7U8zrHBIhH9MXHNBp+Yy/yN19133UY05uuHXHaU2Uv0hxefckjPdkaX7ARso+\n' +
    'O3Ar6nf7YfBwCqSpqsNckKT7KKtf3Ot95wYFpKDa64jcRUfxzRWnmq12IVzczqHI\n' +
    'sIvUZQINw/UHSQcWekdUnMg58bQSHyTjwkj9jcX2RURxaVZkr15wxo/Z3Ydo2PVK\n' +
    '3afEr0/vcuFvE7QeGXiI2DJdVt3JefatZ3rj4VTW2aUZwHGUiWWIUudBfQKR0JEp\n' +
    'lJ8MFaKDh4/A2VEJnXILu1iwvc1m3jCaPuzZKdoHM/1234bznJI2aAfhfIhoHw90\n' +
    'tPO+\n' +
    '-----END CERTIFICATE-----\n';

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(certChainData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509CertChain: cert.X509CertChain = {} as cert.X509CertChain;
  try {
    x509CertChain = await cert.createX509CertChain(encodingBlob);
  }
  catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509CertChain failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509CertChain;
}

async function createX509Cert(): Promise<cert.X509Cert> {
  let certData = '-----BEGIN CERTIFICATE-----\n' +
    'MIIGujCCBaKgAwIBAgISESG8vx4IzALnkqQG05AvM+2bMA0GCSqGSIb3DQEBBQUA\n' +
    'MFkxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMS8wLQYD\n' +
    'VQQDEyZHbG9iYWxTaWduIEV4dGVuZGVkIFZhbGlkYXRpb24gQ0EgLSBHMjAeFw0x\n' +
    'MjA4MTQxMjM1MDJaFw0xMzA4MTUxMDMxMjlaMIIBCjEdMBsGA1UEDwwUUHJpdmF0\n' +
    'ZSBPcmdhbml6YXRpb24xDzANBgNVBAUTBjU3ODYxMTETMBEGCysGAQQBgjc8AgED\n' +
    'EwJVUzEeMBwGCysGAQQBgjc8AgECEw1OZXcgSGFtcHNoaXJlMQswCQYDVQQGEwJV\n' +
    'UzEWMBQGA1UECAwNTmV3IEhhbXBzaGlyZTETMBEGA1UEBwwKUG9ydHNtb3V0aDEg\n' +
    'MB4GA1UECRMXVHdvIEludGVybmF0aW9uYWwgRHJpdmUxDTALBgNVBAsMBC5DT00x\n' +
    'GzAZBgNVBAoMEkdNTyBHbG9iYWxTaWduIEluYzEbMBkGA1UEAwwSd3d3Lmdsb2Jh\n' +
    'bHNpZ24uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqx/nHBP4\n' +
    '6s5KKMDlfZS4qFDiAWsoPSRn6WO4nrUF/G2S3I/AdJ0IcSDOHb48/3APj5alqbgo\n' +
    'o4IzdG6KLAbENpHMl0L3pHBq/5tJPTi02SbiYUHfp2fhueMauRo8spfEk6fNRnDn\n' +
    'QpyMFRkYd7Jz+KMerTO1xAcOH+xp0KkcP0i2jFTEuM3LwR0yTms1rry+RryjDDt5\n' +
    '7W0DLnNFWhyGd6YymzNkCPeL6weV8uk2uYRKKf2XOAzgIpNo3zU6iakZOzlQB9h9\n' +
    'qRuIks2AU/cZ89cBkDjHua0ezX5rG3/Url33jAT9cR5zCXHWtj7VzlOjDXXnn16b\n' +
    'L9/AWsvGMNkYHQIDAQABo4ICxzCCAsMwDgYDVR0PAQH/BAQDAgWgMEwGA1UdIARF\n' +
    'MEMwQQYJKwYBBAGgMgEBMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh\n' +
    'bHNpZ24uY29tL3JlcG9zaXRvcnkvMIIBKwYDVR0RBIIBIjCCAR6CEnd3dy5nbG9i\n' +
    'YWxzaWduLmNvbYIVc3RhdHVzLmdsb2JhbHNpZ24uY29tghF0aC5nbG9iYWxzaWdu\n' +
    'LmNvbYISZGV2Lmdsb2JhbHNpZ24uY29tghNpbmZvLmdsb2JhbHNpZ24uY29tghZh\n' +
    'cmNoaXZlLmdsb2JhbHNpZ24uY29tghZzdGF0aWMxLmdsb2JhbHNpZ24uY29tghZz\n' +
    'dGF0aWMyLmdsb2JhbHNpZ24uY29tghNibG9nLmdsb2JhbHNpZ24uY29tghdzc2xj\n' +
    'aGVjay5nbG9iYWxzaWduLmNvbYIVc3lzdGVtLmdsb2JhbHNpZ24uY29tghhvcGVy\n' +
    'YXRpb24uZ2xvYmFsc2lnbi5jb22CDmdsb2JhbHNpZ24uY29tMAkGA1UdEwQCMAAw\n' +
    'HQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMD8GA1UdHwQ4MDYwNKAyoDCG\n' +
    'Lmh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3MvZ3NleHRlbmR2YWxnMi5jcmww\n' +
    'gYgGCCsGAQUFBwEBBHwwejBBBggrBgEFBQcwAoY1aHR0cDovL3NlY3VyZS5nbG9i\n' +
    'YWxzaWduLmNvbS9jYWNlcnQvZ3NleHRlbmR2YWxnMi5jcnQwNQYIKwYBBQUHMAGG\n' +
    'KWh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9nc2V4dGVuZHZhbGcyMB0GA1Ud\n' +
    'DgQWBBSvMoTDlFB0aVgVrNkkS1QSmYfx1zAfBgNVHSMEGDAWgBSwsEr9HHUo+Bxh\n' +
    'qhP2+sGQPWsWozANBgkqhkiG9w0BAQUFAAOCAQEAgnohm8IRw1ukfc0GmArK3ZLC\n' +
    'DLGpsefwWMvNrclqwrgtVrBx4pfe5xGAjqyQ2QI8V8a8a1ytVMCSC1AMWiWxawvW\n' +
    'fw48fHunqtpTYNDyEe1Q+7tTGZ0SQ3HljYY9toVEjAMDhiM0Szl6ERRO5S7BTCen\n' +
    'mDpWZF8w3ScRRY2UJc8xwWFiYyGWDNzNL1O8R2Y95QIkHUgQpSD3cjl4YvF/Xx/o\n' +
    'hBEzl884uNAggIyQRu0ImLEetEtHWB2w0pZG3nTAqjOAAAyH2Q8IHoJtjQzvg6fy\n' +
    'IQEO1C5GoQ7isiKIjKBXVYOm+gKSQXlzwj1BlU/OW6kEe24IiERhAN9ILA24wA==\n' +
    '-----END CERTIFICATE-----\n';

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(certData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509Cert: cert.X509Cert = {} as cert.X509Cert;
  try {
    x509Cert = await cert.createX509Cert(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509Cert failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509Cert;
}

async function createX509Cert1(): Promise<cert.X509Cert> {
  let certData = '-----BEGIN CERTIFICATE-----\n' +
    'MIIFDzCCA/egAwIBAgIQCxNitu5qnT6WiTDxbiB9OTANBgkqhkiG9w0BAQsFADBh\n' +
    'MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3\n' +
    'd3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD\n' +
    'QTAeFw0yMDAzMDQxMjA0NDBaFw0zMDAzMDQxMjA0NDBaMEQxCzAJBgNVBAYTAlVT\n' +
    'MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxHjAcBgNVBAMTFUdlb1RydXN0IFJTQSBD\n' +
    'TiBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANA1OZJJtZUI\n' +
    '7zj4qFHT79g+Otks4TEfmUEDhrNKBEEjb/i29GBfnpvFdT36azCg2VODJRSjIzFn\n' +
    '4qADcc84EmfKiDEM97HFsQPp9RRkqxH5cB51EU2eBE9Ua95x+wQp/KSdCqITCQ/v\n' +
    'yvm3J4Upjl0wlW8wRCPCWcYw3pKClGRkNzVtI1KXnfpn7fG3N84n7wlBb9IGKJFa\n' +
    'c/6+hxvZx2qnfLsxdIKR0Q/biGoU6Z8Iy/R/p7GoPO8vamV090+QHEL5AdSzKtEh\n' +
    'U9vdvcuWjjLxVnaJLfj/6WoGZj8UWn3zFbEoTVaAfp2xqdzW7yRvi2r148m9ev7l\n' +
    'jDqHo8UX69sCAwEAAaOCAd4wggHaMB0GA1UdDgQWBBQkb5E/iYeHDjLCQBjfxUzr\n' +
    'T8hJMjAfBgNVHSMEGDAWgBQD3lA1VtFMu2bwo+IbG8OXsj3RVTAOBgNVHQ8BAf8E\n' +
    'BAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMBIGA1UdEwEB/wQI\n' +
    'MAYBAf8CAQAwMwYIKwYBBQUHAQEEJzAlMCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz\n' +
    'cC5kaWdpY2VydC5jbjBABgNVHR8EOTA3MDWgM6Axhi9odHRwOi8vY3JsLmRpZ2lj\n' +
    'ZXJ0LmNuL0RpZ2lDZXJ0R2xvYmFsUm9vdENBLmNybDCB3QYDVR0gBIHVMIHSMIHF\n' +
    'BglghkgBhv1sAQEwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0\n' +
    'LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZp\n' +
    'Y2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5\n' +
    'IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9y\n' +
    'cGEtdWEwCAYGZ4EMAQICMA0GCSqGSIb3DQEBCwUAA4IBAQCzkcXq0TN0oSn4UeXp\n' +
    'FBW7U8zrHBIhH9MXHNBp+Yy/yN19133UY05uuHXHaU2Uv0hxefckjPdkaX7ARso+\n' +
    'O3Ar6nf7YfBwCqSpqsNckKT7KKtf3Ot95wYFpKDa64jcRUfxzRWnmq12IVzczqHI\n' +
    'sIvUZQINw/UHSQcWekdUnMg58bQSHyTjwkj9jcX2RURxaVZkr15wxo/Z3Ydo2PVK\n' +
    '3afEr0/vcuFvE7QeGXiI2DJdVt3JefatZ3rj4VTW2aUZwHGUiWWIUudBfQKR0JEp\n' +
    'lJ8MFaKDh4/A2VEJnXILu1iwvc1m3jCaPuzZKdoHM/1234bznJI2aAfhfIhoHw90\n' +
    'tPO+\n' +
    '-----END CERTIFICATE-----\n';

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(certData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509Cert: cert.X509Cert = {} as cert.X509Cert;
  try {
    x509Cert = await cert.createX509Cert(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509Cert failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509Cert;
}

async function createX509Cert2(): Promise<cert.X509Cert> {
  let certData = "-----BEGIN CERTIFICATE-----\n" +
    "MIID1TCCAr2gAwIBAgIITXr1++kFUU4wDQYJKoZIhvcNAQELBQAwcDELMAkGA1UE\n" +
    "BhMCQ04xEjAQBgNVBAgTCWd1YW5nZG9uZzERMA8GA1UEBxMIc2hlbnpoZW4xEjAQ\n" +
    "BgNVBAoTCXRlc3RTZWNDYTESMBAGA1UECxMJdGVzdFNlY0NhMRIwEAYDVQQDEwl0\n" +
    "ZXN0U2VjQ2EwHhcNMjMxMjIxMDAwMDAwWhcNMjcxMjIwMjM1OTU5WjBxMQswCQYD\n" +
    "VQQGEwJDTjEOMAwGA1UECBMFZ2Fuc3UxEDAOBgNVBAcTB2xhbnpob3UxFDASBgNV\n" +
    "BAoTC3Rlc3RUaGlyZENhMRQwEgYDVQQLEwt0ZXN0VGhpcmRDYTEUMBIGA1UEAxML\n" +
    "dGVzdFRoaXJkQ2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDJMKSq\n" +
    "Fn4G4EJATauw+4s+n/JbINBAiuhzURzzdt2T8JJQLDV9RHj4mZt84yv6lqEpl2fm\n" +
    "gIClfu173pEV51/PSq5IaV481u/Dz/OTy9TwfxmIXAWdNpyodDOg4I9K7LC01ge8\n" +
    "xxyKFi7k7m2eTGA4dYQM0E0AEXzCpg2JN3IIIPhzHCIVJmYjcbVxiaFkvT4ZFFUk\n" +
    "4rDSbAQdn6dJ29msrFm8iGhMGC/bzq9Bii38Qg4y4o89QYiboRWCxv3XfuibT+jw\n" +
    "O3pmfsFuT8/bKOWVm94FmRxiKuj6iE8UVewxtByzDgAsBtJKDjaCv3IkqfbIu+sq\n" +
    "/eeJkVJRJXAP3ZpLAgMBAAGjcjBwMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYE\n" +
    "FIxvPSwEmjOMW10H+gn2gy5HvMmMMAsGA1UdDwQEAwIBBjARBglghkgBhvhCAQEE\n" +
    "BAMCAAcwHgYJYIZIAYb4QgENBBEWD3hjYSBjZXJ0aWZpY2F0ZTANBgkqhkiG9w0B\n" +
    "AQsFAAOCAQEAWu0u72g5y1weexPoJQnUgcwVtuC+/tTS9YvyCtKYE91gn97LSWn9\n" +
    "mXXGmLceU27B8JwhER9JeiQO1SUdDcvlfb5vt6eB+5cbZcgeERUBP8t0znh7DbMg\n" +
    "4TFjt9gZ970PZ1OlTBNPoZNRBKIox61KVUhiVKTVSbXlVP1yUF1uSlSq+0NYayHw\n" +
    "MnX1BeLxbAcAsTPYHjoeFJIrGkKlydLyt/8hDQzpLRW5uEUTjjqLh7vef0OaOP80\n" +
    "MmADt6ojRYvwdMDHF0ASJyupLQ+hiRLVadciK8Z5W34JGN2jwEw5X3nXyAgErIJZ\n" +
    "pqdTflnFLnSwy5M3QHB+xjYAcS9l1br2LA==\n" +
    "-----END CERTIFICATE-----\n"

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(certData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509Cert: cert.X509Cert = {} as cert.X509Cert;
  try {
    x509Cert = await cert.createX509Cert(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509Cert failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509Cert;
}

async function createX509Crl(): Promise<cert.X509CRL> {
  let crlData = "-----BEGIN X509 CRL-----\r\n" +
    "MIIChzCCAW8CAQEwDQYJKoZIhvcNAQELBQAwWDELMAkGA1UEBhMCQ04xEDAOBgNV\r\n" +
    "BAgTB0ppYW5nc3UxEDAOBgNVBAcTB05hbmppbmcxCzAJBgNVBAoTAnRzMQswCQYD\r\n" +
    "VQQLEwJ0czELMAkGA1UEAxMCdHMXDTIzMTEyMzAzMzMwMFoXDTIzMTIyMzAzMzMw\r\n" +
    "MFowgbEwNQIIFB75m06RTHwXDTIzMTEyMzAzMzMzOFowGjAYBgNVHRgEERgPMjAy\r\n" +
    "MzExMjMwMzMzMDBaMDUCCFuxCUiyVDK8Fw0yMzExMjMwMzMzNDJaMBowGAYDVR0Y\r\n" +
    "BBEYDzIwMjMxMTIzMDMzMzAwWjBBAghwiZh/5SR/uxcNMjMxMTIwMDgwNDE2WjAm\r\n" +
    "MBgGA1UdGAQRGA8yMDIzMTEyMDA4MDMwMFowCgYDVR0VBAMKAQKgLzAtMB8GA1Ud\r\n" +
    "IwQYMBaAFDfsHTMZwoA6eaDFlBUyDpka+sYtMAoGA1UdFAQDAgEDMA0GCSqGSIb3\r\n" +
    "DQEBCwUAA4IBAQCu5WHvb0bOTQhk4QsZ6g17Ye7am1zGo1P30vo8uC26KR5KtC5e\r\n" +
    "wvTKdAM60JX0Eu9pmR5euVoFHP1AfXZeZq6NVQeQF/aNLKzXV0Z2clb1KYFc8W+S\r\n" +
    "Ibdw8nloQT41G4s0VEqqykvaDgQqetw93lEWYdRdfsXGi8E7TDOWs5uS8yT50d/D\r\n" +
    "4gIrqa5O/AuTnsbBdlVnRzGkzBLaNEdnTWkHe3zEOPIEAXCuy56H1dgaBxw0clWZ\r\n" +
    "fgU3PundaIDSRQfIfI/DTs8cIQ8pRQHWD3DY29NopFnxxDLJMPIRA/4G2IQw3NMO\r\n" +
    "ZwVfn3Vpj1w6lf7EFDp7qarKPI/imPAfaURe\r\n" +
    "-----END X509 CRL-----\r\n";

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(crlData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509CRL: cert.X509CRL = {} as cert.X509CRL;
  try {
    x509CRL = await cert.createX509CRL(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509CRL failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509CRL;
}

async function createX509CrlEntryTest1(): Promise<cert.X509CRL> {
  let crlData = '-----BEGIN X509 CRL-----\n' +
    'MIHzMF4CAQMwDQYJKoZIhvcNAQEEBQAwFTETMBEGA1UEAxMKQ1JMIGlzc3VlchcN\n' +
    'MTcwODA3MTExOTU1WhcNMzIxMjE0MDA1MzIwWjAVMBMCAgPoFw0zMjEyMTQwMDUz\n' +
    'MjBaMA0GCSqGSIb3DQEBBAUAA4GBACEPHhlaCTWA42ykeaOyR0SGQIHIOUR3gcDH\n' +
    'J1LaNwiL+gDxI9rMQmlhsUGJmPIPdRs9uYyI+f854lsWYisD2PUEpn3DbEvzwYeQ\n' +
    '5SqQoPDoM+YfZZa23hoTLsu52toXobP74sf/9K501p/+8hm4ROMLBoRT86GQKY6g\n' +
    'eavsH0Q3\n' +
    '-----END X509 CRL-----\n'

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(crlData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509CRL: cert.X509CRL = {} as cert.X509CRL;
  try {
    x509CRL = await cert.createX509CRL(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509CRL failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509CRL;
}

async function createX509CrlEntryTest2(): Promise<cert.X509CRL> {
  let crlData = '-----BEGIN X509 CRL-----\n' +
    'MIIB6DCB0QIBATANBgkqhkiG9w0BAQsFADCBjjELMAkGA1UEBhMCUlUxFTATBgNV\n' +
    'BAgMDNCc0L7RgdC60LLQsDELMAkGA1UECgwC0K8xCzAJBgNVBAsMAtCvMSowKAYD\n' +
    'VQQDDCHQlNC80LjRgtGA0LjQuSDQkdC10LvRj9Cy0YHQutC40LkxIjAgBgkqhkiG\n' +
    '9w0BCQEWE2JlbGRtaXRAZXhhbXBsZS5jb20XDTE3MDQyNDEzMjUzMVoXDTE3MDUy\n' +
    'NDEzMjUzMVqgDjAMMAoGA1UdFAQDAgEBMA0GCSqGSIb3DQEBCwUAA4IBAQCF5eX+\n' +
    '1BM/BxoHU2/3pQHJgPSKevN0/K/daiFHiJl7Kb9GCwKY14B1RvbN2rUP/58Mt+aq\n' +
    'jvauf1yBzlaJQeJKZcsCmG9p6Tr1y0BJXhrq5kC0SLyNDsfGUTfuxnwmo+clHXRU\n' +
    '+gKuk+h0WkJL022ZYbJ38w588k4NT3CWVHeE23EDC264p942mlDE7en6MyL152Pe\n' +
    'Ld9YrWiq5iOIOrIbQLErq0EjwxvHG9sMiYFUa6VrwmRf26nyZ7u9RKJDP+o2dltw\n' +
    'diBaSXC3Qt3pZ8BIfv/l81lwp8Dr63SwCII2pIRplyICdQqmX/a+1q8kThXIP2Kx\n' +
    '+X48g7VE2o2X4cfy\n' +
    '-----END X509 CRL-----\n';

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(crlData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509CRL: cert.X509CRL = {} as cert.X509CRL;
  try {
    x509CRL = await cert.createX509CRL(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509CRL failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509CRL;
}

async function createX509CrlEntryTest3(): Promise<cert.X509CRL> {
  let crlData = '-----BEGIN X509 CRL-----\n' +
    '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\n' +
    'BsQoO8O2EVpJ54fxKMCSDOkJf1hNCxi3eQ==\n' +
    '-----END X509 CRL-----\n';

  let encodingBlob: cert.EncodingBlob = {
    data: stringToUint8Array(crlData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509CRL: cert.X509CRL = {} as cert.X509CRL;
  try {
    x509CRL = await cert.createX509CRL(encodingBlob);
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error('createX509CRL failed, errCode: ' + e.code + ', errMsg: ' + e.message);
  }
  return x509CRL;
}

export {
  createX509CertChain1,
  createX509Cert,
  createX509Crl,
  createX509Cert1,
  createX509Cert2,
  createX509CrlEntryTest1,
  createX509CrlEntryTest2,
  createX509CrlEntryTest3,
  nameDer,
  nameString
};

export const TrustAnchors_DATA_MAP_01: X509TrustAnchor[] = [{
  CAPubKey: new Uint8Array([0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00, 0x30, 0x82, 0x01, 0x0a, 0x02, 0x82, 0x01, 0x01, 0x00, 0xd0, 0x35, 0x39, 0x92, 0x49, 0xb5, 0x95, 0x08, 0xef, 0x38, 0xf8, 0xa8, 0x51, 0xd3, 0xef, 0xd8, 0x3e, 0x3a, 0xd9, 0x2c, 0xe1, 0x31, 0x1f, 0x99, 0x41, 0x03, 0x86, 0xb3, 0x4a, 0x04, 0x41, 0x23, 0x6f, 0xf8, 0xb6, 0xf4, 0x60, 0x5f, 0x9e, 0x9b, 0xc5, 0x75, 0x3d, 0xfa, 0x6b, 0x30, 0xa0, 0xd9, 0x53, 0x83, 0x25, 0x14, 0xa3, 0x23, 0x31, 0x67, 0xe2, 0xa0, 0x03, 0x71, 0xcf, 0x38, 0x12, 0x67, 0xca, 0x88, 0x31, 0x0c, 0xf7, 0xb1, 0xc5, 0xb1, 0x03, 0xe9, 0xf5, 0x14, 0x64, 0xab, 0x11, 0xf9, 0x70, 0x1e, 0x75, 0x11, 0x4d, 0x9e, 0x04, 0x4f, 0x54, 0x6b, 0xde, 0x71, 0xfb, 0x04, 0x29, 0xfc, 0xa4, 0x9d, 0x0a, 0xa2, 0x13, 0x09, 0x0f, 0xef, 0xca, 0xf9, 0xb7, 0x27, 0x85, 0x29, 0x8e, 0x5d, 0x30, 0x95, 0x6f, 0x30, 0x44, 0x23, 0xc2, 0x59, 0xc6, 0x30, 0xde, 0x92, 0x82, 0x94, 0x64, 0x64, 0x37, 0x35, 0x6d, 0x23, 0x52, 0x97, 0x9d, 0xfa, 0x67, 0xed, 0xf1, 0xb7, 0x37, 0xce, 0x27, 0xef, 0x09, 0x41, 0x6f, 0xd2, 0x06, 0x28, 0x91, 0x5a, 0x73, 0xfe, 0xbe, 0x87, 0x1b, 0xd9, 0xc7, 0x6a, 0xa7, 0x7c, 0xbb, 0x31, 0x74, 0x82, 0x91, 0xd1, 0x0f, 0xdb, 0x88, 0x6a, 0x14, 0xe9, 0x9f, 0x08, 0xcb, 0xf4, 0x7f, 0xa7, 0xb1, 0xa8, 0x3c, 0xef, 0x2f, 0x6a, 0x65, 0x74, 0xf7, 0x4f, 0x90, 0x1c, 0x42, 0xf9, 0x01, 0xd4, 0xb3, 0x2a, 0xd1, 0x21, 0x53, 0xdb, 0xdd, 0xbd, 0xcb, 0x96, 0x8e, 0x32, 0xf1, 0x56, 0x76, 0x89, 0x2d, 0xf8, 0xff, 0xe9, 0x6a, 0x06, 0x66, 0x3f, 0x14, 0x5a, 0x7d, 0xf3, 0x15, 0xb1, 0x28, 0x4d, 0x56, 0x80, 0x7e, 0x9d, 0xb1, 0xa9, 0xdc, 0xd6, 0xef, 0x24, 0x6f, 0x8b, 0x6a, 0xf5, 0xe3, 0xc9, 0xbd, 0x7a, 0xfe, 0xe5, 0x8c, 0x3a, 0x87, 0xa3, 0xc5, 0x17, 0xeb, 0xdb, 0x02, 0x03, 0x01, 0x00, 0x01]),
  CASubject: new Uint8Array([0x30, 0x44, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x55, 0x53, 0x31, 0x15, 0x30, 0x13, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x0c, 0x44, 0x69, 0x67, 0x69, 0x43, 0x65, 0x72, 0x74, 0x20, 0x49, 0x6e, 0x63, 0x31, 0x1e, 0x30, 0x1c, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x15, 0x47, 0x65, 0x6f, 0x54, 0x72, 0x75, 0x73, 0x74, 0x20, 0x52, 0x53, 0x41, 0x20, 0x43, 0x4e, 0x20, 0x43, 0x41, 0x20, 0x47, 0x32]),
}]

export const TrustAnchors_DATA_MAP_02: RevocationCheckParameter = {
  ocspResponses: new Uint8Array([0x30, 0x82, 0x01, 0xd3, 0x0a, 0x01, 0x00, 0xa0, 0x82, 0x01, 0xcc, 0x30, 0x82, 0x01, 0xc8, 0x06, 0x09, 0x2b, 0x06, 0x01, 0x05, 0x05, 0x07, 0x30, 0x01, 0x01, 0x04, 0x82, 0x01, 0xb9, 0x30, 0x82, 0x01, 0xb5, 0x30, 0x81, 0x9e, 0xa2, 0x16, 0x04, 0x14, 0x24, 0x6f, 0x91, 0x3f, 0x89, 0x87, 0x87, 0x0e, 0x32, 0xc2, 0x40, 0x18, 0xdf, 0xc5, 0x4c, 0xeb, 0x4f, 0xc8, 0x49, 0x32, 0x18, 0x0f, 0x32, 0x30, 0x32, 0x34, 0x30, 0x32, 0x32, 0x31, 0x31, 0x33, 0x30, 0x30, 0x33, 0x31, 0x5a, 0x30, 0x73, 0x30, 0x71, 0x30, 0x49, 0x30, 0x09, 0x06, 0x05, 0x2b, 0x0e, 0x03, 0x02, 0x1a, 0x05, 0x00, 0x04, 0x14, 0xd1, 0x5d, 0xff, 0xaa, 0x00, 0x86, 0xa3, 0x32, 0x76, 0x5e, 0x89, 0x07, 0x31, 0xdb, 0xba, 0x75, 0x0b, 0x31, 0x13, 0xdb, 0x04, 0x14, 0x24, 0x6f, 0x91, 0x3f, 0x89, 0x87, 0x87, 0x0e, 0x32, 0xc2, 0x40, 0x18, 0xdf, 0xc5, 0x4c, 0xeb, 0x4f, 0xc8, 0x49, 0x32, 0x02, 0x10, 0x04, 0xc3, 0xb4, 0x5b, 0x70, 0x94, 0xf4, 0xb5, 0x95, 0xc3, 0x56, 0xc4, 0xfe, 0x3a, 0x98, 0xa2, 0x80, 0x00, 0x18, 0x0f, 0x32, 0x30, 0x32, 0x34, 0x30, 0x32, 0x32, 0x31, 0x31, 0x32, 0x34, 0x35, 0x30, 0x31, 0x5a, 0xa0, 0x11, 0x18, 0x0f, 0x32, 0x30, 0x32, 0x34, 0x30, 0x32, 0x32, 0x38, 0x31, 0x31, 0x34, 0x35, 0x30, 0x31, 0x5a, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x0b, 0x05, 0x00, 0x03, 0x82, 0x01, 0x01, 0x00, 0xb0, 0xdf, 0x0f, 0x94, 0x4f, 0x25, 0x05, 0xec, 0x59, 0x65, 0x15, 0xb7, 0x04, 0x91, 0x10, 0x45, 0xf5, 0xbd, 0x26, 0x16, 0xd1, 0x7d, 0x4e, 0x69, 0x2f, 0xb3, 0xb2, 0xb5, 0x1c, 0xaa, 0x1d, 0xe5, 0xe9, 0x2a, 0x52, 0xdb, 0xde, 0x69, 0xed, 0xa0, 0x2e, 0x84, 0x18, 0x88, 0xfd, 0x26, 0x9f, 0xe7, 0x1c, 0x09, 0xba, 0xe8, 0x18, 0x7c, 0x17, 0x5e, 0xfd, 0x1f, 0x52, 0x75, 0x7e, 0xec, 0x3c, 0xf2, 0x1d, 0x55, 0xa4, 0xf7, 0x2c, 0xdf, 0x40, 0x06, 0x8c, 0x19, 0xc2, 0xbc, 0x72, 0xbb, 0xc2, 0xa1, 0xbb, 0xd7, 0xd3, 0x79, 0xb3, 0x70, 0xcb, 0x4c, 0x07, 0x18, 0xbc, 0xd1, 0x4e, 0xe2, 0x3e, 0x18, 0xca, 0x08, 0x3d, 0x7f, 0xbc, 0xf2, 0x0c, 0x1a, 0x2c, 0x10, 0x83, 0x59, 0xa0, 0xfb, 0x1f, 0xc2, 0x0e, 0x26, 0x17, 0x27, 0xa3, 0xba, 0x49, 0x9b, 0x13, 0xdd, 0x55, 0xeb, 0xc8, 0xa2, 0x49, 0x76, 0xcd, 0x46, 0x5a, 0x78, 0x19, 0x26, 0xde, 0xff, 0x66, 0xac, 0x13, 0x42, 0x89, 0x86, 0x7e, 0x5c, 0xa4, 0x67, 0xd7, 0x0d, 0xbb, 0x5f, 0xf4, 0x38, 0x91, 0x87, 0x99, 0xeb, 0xd3, 0x99, 0x97, 0xd8, 0x0c, 0xae, 0xfa, 0x23, 0x2c, 0x4a, 0xbd, 0xd1, 0xe6, 0xa5, 0x31, 0xee, 0x8a, 0x88, 0xc2, 0x5d, 0x61, 0x2c, 0x43, 0x04, 0x33, 0x57, 0x16, 0x98, 0xc2, 0x9a, 0x01, 0xd1, 0xad, 0x8b, 0xa5, 0x56, 0x0b, 0xd9, 0x4c, 0x81, 0x88, 0x90, 0x92, 0x07, 0x38, 0xf3, 0xab, 0x38, 0xf8, 0xbc, 0x97, 0x59, 0xae, 0x71, 0xea, 0x25, 0x05, 0x75, 0x3f, 0x35, 0x0b, 0x00, 0xcc, 0x1b, 0xe3, 0x32, 0x46, 0x01, 0x72, 0x4c, 0x46, 0x1a, 0x72, 0xd4, 0x7f, 0x4a, 0x94, 0x4f, 0x82, 0xf8, 0x69, 0x86, 0x40, 0x32, 0x69, 0x79, 0xbd, 0x09, 0x16, 0x2b, 0xbb, 0x9a, 0x0a, 0x11, 0xa9, 0x65, 0xf0, 0xac, 0xbe, 0xd8]),
}

const nameDer = new Uint8Array([0x30, 0x44, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x55, 0x53, 0x31, 0x15, 0x30, 0x13, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x0c, 0x44, 0x69, 0x67, 0x69, 0x43, 0x65, 0x72, 0x74, 0x20, 0x49, 0x6e, 0x63, 0x31, 0x1e, 0x30, 0x1c, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x15, 0x47, 0x65, 0x6f, 0x54, 0x72, 0x75, 0x73, 0x74, 0x20, 0x52, 0x53, 0x41, 0x20, 0x43, 0x4e, 0x20, 0x43, 0x41, 0x20, 0x47, 0x32]);

const nameString = '/businessCategory=Private Organization/serialNumber=578611/jurisdictionC=US/jurisdictionST=New Hampshire/C=US/ST=New Hampshire/L=Portsmouth/street=Two International Drive/OU=.COM/O=GMO GlobalSign Inc/CN=www.globalsign.com';
