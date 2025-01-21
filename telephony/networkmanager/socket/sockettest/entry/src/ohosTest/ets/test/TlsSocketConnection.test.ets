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

import { describe, beforeAll, afterAll, it, expect, beforeEach, afterEach } from '@ohos/hypium';
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

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 30240,
  family: 1
};

let addrClient: socket.NetAddress = {
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
    useRemoteCipherPrefer: false,
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
    useRemoteCipherPrefer: false,
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

export default function TLSSocketConnectionTest() {
  describe('TLSSocketConnectionTest', () => {
    beforeAll(() => {
      console.info('************* start SocketTest *************');
    })
    afterAll(() => {
      console.info('************* end SocketTest *************');
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_Send_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionSend0400
     * @tc.desc  :  Do not monitor the service for testing,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionSend0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionSend0400';
      console.info(`${caseName} test start `);
      try {
        tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
          client.send('ok', (err: BusinessError) => {
            if (err) {
              expectFail(false);
              done();
            }
            expectFail(true);
            done();
          });
        });
        await tlsClient.bind(addr).then(() => {
          tlsClient.connect(connOpt).then(() => {
            try {
              tlsClient.send('Hello, client!', (err: BusinessError) => {
                if (err) {
                  expectFail(false);
                  done();
                }
              })
              expectFail(true);
              done();
            } catch (err) {
              expectFail(false);
              tlsClient.close();
              done();
            }
          }).catch((err: Object) => {
            expectFail(true);
            done();
          })
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_Send_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionSend0500
     * @tc.desc  :  Send an empty ip,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionSend0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionSend0500';
      console.info(`${caseName} test start `);
      try {
        let addr26: socket.NetAddress = {
          address: '',
          port: 30026
        };
        let tlsConnectOptions26: socket.TLSConnectOptions = {
          address: addr26,
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
        let connOpt26: socket.TLSConnectOptions = {
          address: addr26,
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
        await tlsServer.listen(tlsConnectOptions26);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          try {
            conn.send(sendBuf).then(() => {}).catch((err: Object) => {})
            expectFail(false);
          } catch (err) {
            expectFail(false);
            done();
          }
        });
        await tlsClient.bind(addr26).then(() => {
          tlsClient.connect(connOpt26).then(() => {
            tlsClient.send('Hello, client!', (err: BusinessError) => {
              if (err) {
                expectFail(false);
                tlsClient.close();
                done();
              }
            })
          })
        }).catch((err: Object) => {
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteAddress_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0500
     * @tc.desc  :  Test the interface before listen,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0500';
      console.info(`${caseName} test start `);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let addr14: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3014
        };
        let addr13: socket.NetAddress = {
          address: '127.0.0.1',
          port: 30000
        };
        let connOpt13: socket.TLSConnectOptions = {
          address: addr13,
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
        let tlsConnectOptions14: socket.TLSConnectOptions = {
          address: addr14,
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
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          expectFail(true);
          done();
          try {
            conn.getRemoteAddress().then((data: socket.NetAddress) => {
              expectFail(true);
              done();
            }).catch((err: BusinessError) => {
              expectFail(false);
              done();
            });
          } catch (err) {
            expectFail(false);
            done();
          }
        });
        await tlsClient.bind(addr13).then(() => {
          tlsClient.connect(connOpt13).then(() => {
            let sendBuf: string = 'client send to server...';
            tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {
              expectFail(true);
              done();
            })
          }).catch((err: Object) => {
            expectFail(true);
            tlsClient.close();
            done();
          });
          tlsClient.on('message', (value) => {
            let str: string = '';
            for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
              str += String.fromCharCode(new Uint8Array(value.message)[i]);
            }
          })
        }).catch((err: Object) => {})
        await tlsServer.listen(tlsConnectOptions14);
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteAddress_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0600
     * @tc.desc  :  Ca is empty,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteAddress0600';
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
        let addr13: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3013
        };
        let connOpt: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: '',
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
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions13: socket.TLSConnectOptions = {
          address: addr13,
          secureOptions: {
            ca: '',
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
        await tlsServer.listen(tlsConnectOptions13);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.send(sendBuf).then(() => {
            expectFail(true);
            done();
          }).catch((err: Object) => {})
          conn.getRemoteAddress().then((data: socket.NetAddress) => {
            expectFail(false);
            done();
          }).catch((err: BusinessError) => {
            expectFail(true);
            done();
          });
        });
        tlsClient.bind(addr).then(() => {
          tlsClient.connect(connOpt).then(() => {
            let sendBuf: string = 'client send to server...';
            tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {
              tlsClient.close();
            })
          }).catch((err: Object) => {
            expectFail(true);
            done();
          });
          tlsClient.on('message', (value) => {
            let str: string = '';
            for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
              str += String.fromCharCode(new Uint8Array(value.message)[i]);
            }
          })
        }).catch((err: Object) => {});
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteCertificate_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0200
     * @tc.desc  :  Ca is an empty test interface,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0200';
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
        let addr11: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3011
        };
        let connOpt: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: '',
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
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions11: socket.TLSConnectOptions = {
          address: addr11,
          secureOptions: {
            ca: '',
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
        await tlsServer.listen(tlsConnectOptions11);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.getRemoteCertificate((err: BusinessError, data: socket.X509CertRawData) => {
            if (err) {
              expectFail(false);
              done();
            } else {
              expectFail(true);
              done();
            }
          });
          conn.send(sendBuf).then(() => {
            expectFail(true);
            done();
          }).catch((err: Object) => {})
        });
        tlsClient.bind(addr).then(() => {
          tlsClient.connect(connOpt).then(() => {
            let sendBuf: string = 'client send to server...';
            tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {
              tlsClient.close();
            })
          }).catch((err: Object) => {
            expectFail(true);
            done();
          });
          tlsClient.on('message', (value) => {
            let str: string = '';
            for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
              str += String.fromCharCode(new Uint8Array(value.message)[i]);
            }
          })
        }).catch((err: Object) => {})
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteCertificate_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0300
     * @tc.desc  :  Key is an empty test interface,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0300';
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
        let addr10: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3010
        };
        let connOpt: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            cert: cert_client,
            key: '',
            password: '123456',
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions10: socket.TLSConnectOptions = {
          address: addr10,
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
        await tlsServer.listen(tlsConnectOptions10);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.getRemoteCertificate((err: BusinessError, data: socket.X509CertRawData) => {
            if (err) {
              expectFail(true);
              done();
            } else {
              expectFail(false);
              done();
            }
          });
          conn.send(sendBuf).then(() => {}).catch((err: Object) => {})
        });
        try {
          tlsClient.bind(addr).then(() => {
            tlsClient.connect(connOpt).then(() => {
              let sendBuf: string = 'client send to server...';
              tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {})
            }).catch((err: Object) => {
              expectFail(true);
              done();
            });
            tlsClient.on('message', (value) => {
              let str: string = '';
              for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
                str += String.fromCharCode(new Uint8Array(value.message)[i]);
              }
            })
          }).catch((err: Object) => {
            expectFail(true);
            done();
          })
        } catch (err) {
          expectFail(true);
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteCertificate_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0400
     * @tc.desc  :  cert is an empty test interface,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0400';
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
        let addr9: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3009
        };
        let connOpt: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            cert: '',
            key: pri_key_client,
            password: '123456',
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions9: socket.TLSConnectOptions = {
          address: addr9,
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
        await tlsServer.listen(tlsConnectOptions9);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.getRemoteCertificate().then((data: socket.X509CertRawData) => {
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            expectFail(false);
            done();
          });
          conn.send(sendBuf).then(() => {}).catch((err: Object) => {})
        });
        try {
          tlsClient.bind(addr).then(() => {
            tlsClient.connect(connOpt).then(() => {
              let sendBuf: string = 'client send to server...';
              tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {
                tlsClient.close();
              })
            }).catch((err: Object) => {
              expectFail(true);
              done();
            });
            tlsClient.on('message', (value) => {
              let str: string = '';
              for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
                str += String.fromCharCode(new Uint8Array(value.message)[i]);
              }
            })
          }).catch((err: Object) => {
            expectFail(true);
            done();
          })
        } catch (err) {
          expectFail(true);
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetRemoteCertificate_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0500
     * @tc.desc  :  password is an empty test interface,Use Callback asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetRemoteCertificate0500';
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
        let addr8: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3008
        };
        let connOpt: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: ca_common,
            cert: cert_client,
            key: pri_key_client,
            password: '',
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions8: socket.TLSConnectOptions = {
          address: addr8,
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
        await tlsServer.listen(tlsConnectOptions8);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.getRemoteCertificate((err: BusinessError, data: socket.X509CertRawData) => {
            if (err) {
              expectFail(true);
              done();
            } else {
              expectFail(false);
              done();
            }
          });
          conn.send(sendBuf).then(() => {}).catch((err: Object) => {})
        });
        try {
          tlsClient.bind(addr).then(() => {
            tlsClient.connect(connOpt).then(() => {
              let sendBuf: string = 'client send to server...';
              tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {})
            }).catch((err: Object) => {
              expectFail(true);
              done();
            });
            tlsClient.on('message', (value) => {
              let str: string = '';
              for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
                str += String.fromCharCode(new Uint8Array(value.message)[i]);
              }
            });
            tlsClient.close();
            done();
          }).catch((err: Object) => {
            expectFail(true);
            done();
          })
        } catch (err) {
          expectFail(true);
          done();
        }
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketConnection_GetCipherSuite_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketConnectionGetCipherSuite0600
     * @tc.desc  :  Get the cipher suite negotiated by both parties,Use Promise asynchronous callback.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testNetworkMgrSocketTLSSocketConnectionGetCipherSuite0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConnectionGetCipherSuite0600';
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
        let addrtest6: socket.NetAddress = {
          address: '127.0.0.1',
          port: 3001
        };
        let addrTest: socket.NetAddress = {
          address: '127.0.0.1111',
          port: 3000
        };
        let connOptTest: socket.TLSConnectOptions = {
          address: addrTest,
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
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: addrtest6,
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
        await tlsServer.listen(tlsConnectOptions);
        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          let sendBuf: string = '\0\0\0';
          sendBuf += 'abcd';
          sendBuf += '\0\0\0';
          sendBuf += '1234';
          sendBuf += '\0\0\0';
          sendBuf += '5678';
          conn.getCipherSuite().then((data: Array<string>) => {
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            expectFail(false);
            done();
          });
        });
        tlsClient.bind(addrTest).then(() => {
          tlsClient.connect(connOptTest).then(() => {
            let sendBuf: string = 'client send to server...';
            tlsClient.send(sendBuf).then(() => {}).catch((err: Object) => {})
          }).catch((err: Object) => {});
          tlsClient.on('message', (value) => {
            let str: string = '';
            for (let i: number = 0; i < new Uint8Array(value.message).length; ++i) {
              str += String.fromCharCode(new Uint8Array(value.message)[i]);
            }
          })
        }).catch((err: Object) => {
          expectFail(true);
          done();
        })
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    })
  })
}
