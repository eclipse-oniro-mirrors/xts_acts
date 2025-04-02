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

import { describe, it } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  expectFalse,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';

let ca_common: string[] = [
  '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
];
let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 0,
  family: 1
};
let connOpt: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: ca_common,
    cert: cert_client,
    key: pri_key_client,
    password: '123456',
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

let tlsConnectOptions: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: ca_common,
    key: pri_key_server,
    password: '123456',
    cert: cert_server,
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

export default function TLSSocketTest() {
  describe('TLSSocketTest', () => {

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_ConstructTLSSocketInstance_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100
     * @tc.desc  :  Create and return a TLSSocket object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100';
      console.info(`${caseName} test start`);
      try {
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        console.info(`${caseName} ${JSON.stringify(tlsClient)}`);
        expectTrue(tlsClient != null);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
          tlsSocket.close();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1100
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1300
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1400
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1500
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1600
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1700
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1800
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1800
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(true);
        done();
      }
    });
    
        /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1900
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1900
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1900';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: 'www.baidu.com',
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0100
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        tlsSocket.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectTrue(data.isBound);
            expectFalse(data.isClose);
            expectFalse(data.isConnected);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0300
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data.isBound);
            expectFalse(data.isClose);
            expectFalse(data.isConnected);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0500
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        tlsSocket.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectTrue(data.isBound);
          expectFalse(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0700
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectFalse(data.isBound);
          expectFalse(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0100
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0200
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0200';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0300
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: { on: true, linger: 10 },
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0400
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0500
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 100000,
          sendBufferSize: 100000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0600
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: -1
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0700
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: -1 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0800
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0800
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: 100000 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1100
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1100
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1200
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1200
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1200';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1300
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1300
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: { on: true, linger: 10 },
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1400
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1400
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1500
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1500
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 100000,
          sendBufferSize: 100000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1600
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1600
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: -1
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1700
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1700
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: -1 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1800
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1800
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: 100000 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
  });
}
