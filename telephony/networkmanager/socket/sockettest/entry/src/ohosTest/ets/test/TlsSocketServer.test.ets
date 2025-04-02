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

import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import netSocket from '@ohos.net.socket';
import socket from '@ohos.net.socket';
import { BusinessError, Callback, ErrorCallback } from '@ohos.base';
import data from '@ohos.telephony.data';
import util from "@ohos.util";

let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();

let ca_common: string[] = [
  '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
];
let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';

let TAG: string = 'netstack ';
let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 3000
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

function tlsSocketServerTrue(params: socket.TLSSocketServer | socket.X509CertRawData | socket.TLSSocketConnection) {
  try {
    expect(params !== null).assertTrue();
  } catch (err) {
    return console.info(JSON.stringify(err));
  }
}

function expectFail(params: boolean) {
  try {
    if (params === true) {
      expect(params).assertTrue();
    } else {
      expect(params).assertFail();
    }
  } catch (err) {
    return console.info(JSON.stringify(err));
  }
}

export default function TLSSocketServerTest() {
  describe('TLSSocketServerTest', () => {
    beforeAll(() => {
      console.info('************* start SocketTest *************');
    })
    afterAll(() => {
      console.info('************* end SocketTest *************');
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_constructTLSSocketServerInstance_0100
     * @tc.name  :  testNetworkMgrSocketconstructTLSSocketServerInstance0100
     * @tc.desc  :  Create and return a TLSSocketServer object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketconstructTLSSocketServerInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketconstructTLSSocketServerInstance0100';
      console.info(`${caseName} test start `);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsSocketServerTrue(tlsServer);
        done();
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0100
     * @tc.desc  :  Test tlssocket listening, Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0100';
      console.info(`${caseName} test start `);
      try {
        tlsServer.listen(tlsConnectOptions, (err: BusinessError) => {
          if (err) {
            expectFail(false);
          }
          expectFail(true);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0200
     * @tc.desc  :  Test whether listen can be run within the on method,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0200';
      console.info(`${caseName} test start `);
      try {
        tlsServer.on('connect', data => {
          expect(data.clientId != undefined).assertTrue();
        });
        tlsServer.listen(tlsConnectOptions, (err: BusinessError) => {
          if (err) {
            expectFail(false);
          }
          expectFail(true);
          done();
        });
        tlsServer.off('connect');
        done();
      } catch (error) {
        expect(error === null).assertFalse();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0300
     * @tc.desc  :  Test whether the listen method can run before the on method,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0300';
      console.info(`${caseName} test start `);
      try {
        tlsServer.listen(tlsConnectOptions, (err: BusinessError) => {
          if (err) {
            expectFail(false);
            done();
          }
          expectFail(true);
          done();
        })
      } catch (listenErr) {
        expectFail(false);
        done();
      }
      tlsServer.on('connect', (data: socket.TLSSocketConnection) => {});
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0400
     * @tc.desc  :  Test whether other ip can run the listen method separately,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0400';
      console.info(`${caseName} test start `);
      try {
        tlsServer.listen(tlsConnectOptions).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0500
     * @tc.desc  :  Test whether the local startup service can run the listen method,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0500';
      console.info(`${caseName} test start `);
      try {
        tlsServer.listen(tlsConnectOptions).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0600
     * @tc.desc  :  Test whether listen can be enabled if key is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0600';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
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
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0700
     * @tc.desc  :  Test whether listen can be enabled if ca is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0700';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          ''
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
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
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0800
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0800
     * @tc.desc  :  Test whether listen can be enabled if cert is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0800';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = ''
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
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
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_0900
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen0900
     * @tc.desc  :  Test whether listen can be enabled if password is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen0900';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1000
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1000
     * @tc.desc  :  Test whether listen can be enabled if password is undefined,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1000';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: undefined,
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1100
     * @tc.desc  :  Test whether listen can be enabled if protocols is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1100';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1200
     * @tc.desc  :  Test whether listen can be enabled if protocols is 1.3,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1200';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv13],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1300
     * @tc.desc  :  Test whether listen can be enabled if useRemoteCipherPrefer is false,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1300';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: false,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1400
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1400
     * @tc.desc  :  Test whether listen can be enabled if useRemoteCipherPrefer is true,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1400';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
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
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1500
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1500
     * @tc.desc  :  Test whether listen can be enabled if signatureAlgorithms is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1500';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1600
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1600
     * @tc.desc  :  Test whether listen can be enabled if signatureAlgorithms is undefined,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1600';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: undefined,
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1700
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1700
     * @tc.desc  :  Test whether listen can be enabled if cipherSuite is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1700';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: ""
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1800
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1800
     * @tc.desc  :  Test whether listen can be enabled if cipherSuite is undefined,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1800';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: undefined
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_1900
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen1900
     * @tc.desc  :  Test IPv6,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen1900';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000,
          family: 2
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: undefined
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_2000
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen2000
     * @tc.desc  :  Test the maximum legal port,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen2000';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: ""
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_2100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen2100
     * @tc.desc  :  Test the smallest legal port,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen2100';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: ""
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_2200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListen2200
     * @tc.desc  :  The test exceeds the legitimate port,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerListen2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListen2200';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 30000000
        };
        let tlsConnectOptions4: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: ""
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsServer.listen(tlsConnectOptions4).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0100
     * @tc.desc  :  After the listen of TLSSocketServer is successful, get the TLSSocketServer status, Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0100';
      console.info(`${caseName} test start `);
      await tlsServer.listen(tlsConnectOptions);
      try {
        tlsServer.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            done();
          }
          expect(data != null).assertTrue();
          done();
        })
      } catch (errState) {
        expect(true).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0200
     * @tc.desc  :  Get link status when key is empty,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0200';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions2: socket.TLSConnectOptions = {
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
        await tlsServer.listen(tlsConnectOptions2);
        try {
          tlsServer.getState((err: BusinessError, data: socket.SocketStateBase) => {
            if (err) {}
            expect(data != null).assertTrue();
            done();
          })
        } catch (errState) {
          expect(true).assertFail();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0300
     * @tc.desc  :  Get additional ip link status,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0300';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.2',
          port: 3000
        };
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions3: socket.TLSConnectOptions = {
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
        await tlsServer.listen(tlsConnectOptions3);
        try {
          tlsServer.getState((err: BusinessError, data: socket.SocketStateBase) => {
            if (err) {}
            expect(data != null).assertTrue();
            done();
          })
        } catch (errState) {
          expect(true).assertFail();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0400
     * @tc.desc  :  Get TLSSocketServer link status (onconnect),Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0400';
      console.info(`${caseName} test start `);
      try {
        tlsServer.listen(tlsConnectOptions, (err: BusinessError) => {
          if (err) {
            expect(true).assertFail();
          }
          expect(true).assertTrue();
          done();
        })
        try {
          await tlsServer.getState().then((data: socket.SocketStateBase) => {
            expect(data !== null).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            expect(err != null).assertFail();
            done();
          });
          tlsServer.on('connect', (data: socket.TLSSocketConnection) => {});
        } catch (errState) {
          expect(true).assertFail();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0500
     * @tc.desc  :  Get TLSSocketServer link status (ca is empty),Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0500';
      console.info(`${caseName} test start `);
      try {
        let ca_common2: string[] = [];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
        let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';
        let TAG: string = 'NETSTACK ';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsConnectOptions5: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common2,
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
        tlsServer.listen(tlsConnectOptions5, (err: BusinessError) => {
          if (err) {
            expect(true).assertFail();
            done();
          }
          expect(true).assertTrue();
          done();
        })
        try {
          await tlsServer.getState().then((data: socket.SocketStateBase) => {
            expect(data !== null).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            expect(err != null).assertFail();
            done();
          });
        } catch (errState) {
          expect(true).assertFail();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetState_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetState0600
     * @tc.desc  :  Get TLSSocketServer link status (listen is not set),Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetState0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetState0600';
      console.info(`${caseName} test start `);
      try {
        tlsServer.getState().then((data: socket.SocketStateBase) => {
          expect(data !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        });
      } catch (errState) {
        expect(true).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0100
     * @tc.desc  :  Set other properties of the TLSSocketServer connection,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0100';
      console.info(`${caseName} test start `);
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            expect(true).assertFail();
            done();
          }
          expect(true).assertTrue();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0200
     * @tc.desc  :  Test after modifying OOBInline,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0200';
      console.info(`${caseName} test start `);
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: false,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            expect(true).assertFail();
            done();
          }
          expect(true).assertTrue();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0300
     * @tc.desc  :  Test and modify TCPNoDelay,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0300';
      console.info(`${caseName} test start `);
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            expect(true).assertFail();
            done();
          }
          expect(true).assertTrue();
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0400
     * @tc.desc  :  Test and modify socketLinger,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0400';
      console.info(`${caseName} test start `);
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: false, linger: 10
        },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      };
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(err !== null).assertFail();
          done();
        });
      } catch (setEOErr) {
        expect(setEOErr).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0500
     * @tc.desc  :  Test and modify socketLinger,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0500';
      console.info(`${caseName} test start `);
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: false, linger: 10
        },
        receiveBufferSize: 100,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      };
      await tlsServer.listen(tlsConnectOptions);
      try {
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(err !== null).assertFail();
          done();
        });
      } catch (setEOErr) {
        expect(setEOErr).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0600
     * @tc.desc  :  Test and modify socketimeout,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0600';
      console.info(`${caseName} test start `);
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: false, linger: 10
        },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 0
      };
      await tlsServer.listen(tlsConnectOptions);
      try {
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          expect(err !== null).assertFail();
          done();
        });
      } catch (setEOErr) {
        expect(setEOErr).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptions0700
     * @tc.desc  :  Test and modify reuseAddress,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptions0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptions0700';
      console.info(`${caseName} test start `);
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: false,
        socketLinger: {
          on: true, linger: 60000
        },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 0
      };
      await tlsServer.listen(tlsConnectOptions);
      try {
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          expectFail(true);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0100
     * @tc.desc  :  Test to obtain a certificate,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0100';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.getCertificate().then((data: socket.X509CertRawData) => {
          done();
        }).catch((err: BusinessError) => {
          expectFail(false);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0200
     * @tc.desc  :  The test returned an error code 401,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0200';
      console.info(`${caseName} test start `);
      let ca_common3: string[] = [];
      let tlsConnectOptions7: socket.TLSConnectOptions = {
        address: addr,
        secureOptions: {
          ca: ca_common3,
          key: '',
          password: '12345',
          cert: '',
          protocols: [socket.Protocol.TLSv12],
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      };
      await tlsServer.listen(tlsConnectOptions7);
      try {
        tlsServer.getCertificate().then((data: socket.X509CertRawData) => {
          done();
        })
      } catch (err) {
        expect(err != null).assertFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0300
     * @tc.desc  :  Other port interface testing,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0300';
      console.info(`${caseName} test start `);
      try {
        let ca_common3: string[] = [];
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 30000
        };
        let tlsConnectOptions8: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common3,
            key: '',
            password: '12345',
            cert: '',
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        await tlsServer.listen(tlsConnectOptions);
        try {
          tlsServer.getCertificate((err: BusinessError, data: socket.X509CertRawData) => {
            expect(data != null).assertTrue();
            done();
          })
        } catch (err) {
          expect(err != null).assertFail();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0400
     * @tc.desc  :  Open on and off before testing,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0400';
      console.info(`${caseName} test start `);
      try {
        let ca_common3: string[] = [];
        let addr: socket.NetAddress = {
          address: '',
          port: 0
        };
        let tlsConnectOptions8: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common3,
            key: '',
            password: '12345',
            cert: '',
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        await tlsServer.listen(tlsConnectOptions8);
        let callback: Callback<socket.TLSSocketConnection> = (data: socket.TLSSocketConnection) => {}
        tlsServer.on('connect', callback);
        tlsServer.off('connect');
        tlsServer.getCertificate().then((data: socket.X509CertRawData) => {
          expectFail(true);
          done();
        }).catch((err: BusinessError) => {
          expectFail(false);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0500
     * @tc.desc  :  Set other configuration items,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0500';
      console.info(`${caseName} test start `);
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 30000
        };
        await tlsServer.listen(tlsConnectOptions);
        await tlsServer.setExtraOptions(tcpExtraOptions);
        tlsServer.getCertificate((err: BusinessError, data: socket.X509CertRawData) => {
          if (err) {
            expectFail(false);
            done();
          }
          tlsSocketServerTrue(data);
          expectFail(true);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`testNetworkMgrSocketTLSSocketServerGetCertificate0500 test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetCertificate_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetCertificate0600
     * @tc.desc  :  Do not monitor the service,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetCertificate0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetCertificate0600';
      console.info(`${caseName} test start `);
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 300
        };
        tlsServer.getCertificate((err: BusinessError, data: socket.X509CertRawData) => {
          if (err) {
            expectFail(true);
            done();
          }
          tlsSocketServerTrue(data);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetProtocol_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetProtocol0100
     * @tc.desc  :  Get the communication protocol version,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetProtocol0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetProtocol0100';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.getProtocol((err: BusinessError, data: string) => {
          if (err) {
            expectFail(false);
          } else {
            expectFail(true);
          }
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetProtocol_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetProtocol0200
     * @tc.desc  :  Verify that other ip can obtain the protocol version successfully,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetProtocol0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetProtocol0200';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let addr: socket.NetAddress = {
          address: '127.0.0.1233',
          port: 3000
        };
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.getProtocol((err: BusinessError, data: string) => {
          if (err) {
            expectFail(false);
          } else {
            expectFail(true);
          }
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_GetProtocol_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerGetProtocol0300
     * @tc.desc  :  Do not configure the protocol version,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerGetProtocol0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerGetProtocol0300';
      console.info(`${caseName} test start `);
      try {
        let ca_common: string[] = [
          '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
        ];
        let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
        let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            key: pri_key_server,
            password: '123456',
            cert: cert_server,
            protocols: [],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.getProtocol((err: BusinessError, data: string) => {
          if (err) {
            expectFail(false);
          } else {
            expectFail(true);
          }
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_On_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOn0100
     * @tc.desc  :  Do not set whether the client can trigger the subscription,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketServerOn0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOn0100';
      console.info(`${caseName} test start `);
      try {
        await tlsClient.bind(addr);
        await tlsClient.connect(connOpt);
        try {
          expectFail(true);
          done();
          tlsServer.on('connect', (data: socket.TLSSocketConnection) => {
            if (data.clientId == 1 || data.clientId == 2) {
              expectFail(true);
              done();
            }
            expectFail(true);
            tlsClient.close();
            done();
          });
        } catch (err) {
          expectFail(false);
          done();
        }
      } catch (err) {
        expectFail(true);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_On_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOn0300
     * @tc.desc  :  Client binds to other ports,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketServerOn0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOn0300';
      console.info(`${caseName} test start `);
      await tlsServer.listen(tlsConnectOptions);
      let addr2: socket.NetAddress = {
        address: '127.0.0.1',
        port: 300000
      };
      let connOpt33333: socket.TLSConnectOptions = {
        address: addr2,
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
      try {
        tlsServer.on('connect', (data: socket.TLSSocketConnection) => {
          expectFail(false);
          done();
        });
        tlsClient.bind(addr2).then(() => {
          tlsClient.connect(connOpt33333).then(() => {}).catch((err: Object) => {
            expectFail(true);
            done();
          })
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Off_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOff0100
     * @tc.desc  :  Unsubscribe to all,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOff0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOff0100';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr2: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        tlsClient.bind(addr2);
        let callback: Callback<socket.TLSSocketConnection> = (data: socket.TLSSocketConnection) => {
          tlsClient.close();
          expectFail(false);
          done();
        };
        tlsServer.on('connect', callback);
        tlsServer.off('connect');
        tlsClient.connect(connOpt);
        expectFail(true);
        done();
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Off_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOff0200
     * @tc.desc  :  Unsubscribe to the specified connection,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOff0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOff0200';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr2: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        tlsClient.bind(addr2);
        let callback: Callback<socket.TLSSocketConnection> = (data: socket.TLSSocketConnection) => {
          expectFail(false);
          tlsClient.close();
          done();
        };
        tlsServer.on('connect', callback);
        tlsServer.off('connect', callback);
        tlsClient.connect(connOpt);
        expectFail(true);
        done();
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Off_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOff0300
     * @tc.desc  :  Set up another ip or port,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOff0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOff0300';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr3: socket.NetAddress = {
          address: '127.0.0.122222',
          port: 800000
        };
        tlsClient.bind(addr3);
        let callback: Callback<socket.TLSSocketConnection> = (data: socket.TLSSocketConnection) => {
          expectFail(false);
          tlsClient.close();
          done();
        };
        tlsServer.on('connect', callback);
        tlsServer.off('connect', callback);
        tlsClient.connect(connOpt);
        expectFail(true);
        done();
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OnE_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOnE0100
     * @tc.desc  :  Test the On Error event,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOnE0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOnE0100';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr3: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3000
        };
        tlsClient.bind(addr3);
        tlsClient.connect(connOpt);
        try {
          tlsServer.on('error', (err: BusinessError) => {});
          expectFail(true);
          done();
        } catch (err) {
          expectFail(false);
          tlsClient.close();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OnE_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOnE0200
     * @tc.desc  :  Client binds to other ip,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOnE0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOnE0200';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr3: socket.NetAddress = {
          address: '127.0.0.20',
          port: 3000
        };
        let connOpt2: socket.TLSConnectOptions = {
          address: addr3,
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
        tlsClient.bind(addr3);
        tlsClient.connect(connOpt2);
        try {
          tlsServer.on('error', (err: BusinessError) => {});
          expectFail(true);
          done();
        } catch (err) {
          expectFail(false);
          await tlsClient.close();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OnE_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOnE0300
     * @tc.desc  :  Client binds to other port,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOnE0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOnE0300';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        let addr3: socket.NetAddress = {
          address: '127.0.0.1',
          port: 30
        };
        let connOpt2: socket.TLSConnectOptions = {
          address: addr3,
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
        tlsClient.bind(addr3);
        tlsClient.connect(connOpt2);
        try {
          tlsServer.on('error', (err: BusinessError) => {});
          expectFail(true);
          done();
        } catch (err) {
          tlsClient.close();
          expectFail(false);
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OffE_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOffE0100
     * @tc.desc  :  Unsubscribe to error events for TLSSocketServer connections,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOffE0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOffE0100';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsClient.bind(addr);
        tlsClient.connect(connOpt);
        tlsServer.on('error', (err: BusinessError) => {});
        try {
          tlsServer.off('error');
          expectFail(true);
          done();
        } catch (err) {
          expectFail(false);
          await tlsClient.close();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OffE_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOffE0200
     * @tc.desc  :  The test specifies that the callback in the incoming on cancels a subscription,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOffE0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOffE0200';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsClient.bind(addr);
        tlsClient.connect(connOpt);
        let callback: ErrorCallback = (err: BusinessError) => {};
        tlsServer.on('error', callback);
        try {
          tlsServer.off('error', callback);
          expectFail(true);
          done();
        } catch (err) {
          expectFail(false);
          await tlsClient.close();
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OffE_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerOffE0300
     * @tc.desc  :  Test whether the subscription event can be cancelled if it is not enabled,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketTLSSocketServerOffE0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOffE0300';
      console.info(`${caseName} test start `);
      try {
        await tlsServer.listen(tlsConnectOptions);
        tlsClient.bind(addr);
        tlsClient.connect(connOpt);
        try {
          tlsServer.off('error');
          expectFail(true);
          done();
        } catch (err) {
          await tlsClient.close();
          expectFail(false);
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })
  })
}