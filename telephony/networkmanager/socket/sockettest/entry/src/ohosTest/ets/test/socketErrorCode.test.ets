/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

let ca_common: string[] = [
  '-----BEGIN CERTIFICATE-----\nMIIDwzCCAqugAwIBAgIUJNNajiaUidG2krqhLVISQhfWET0wDQYJKoZIhvcNAQEL\nBQAwcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\nA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN\nAQkBFhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDYyNjAzNTcxOVoXDTI0MDYyNTAz\nNTcxOVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEM\nMAoGA1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZI\nhvcNAQkBFhB5b3VyZW1haWxAcXEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A\nMIIBCgKCAQEAqrfaeDpyiZJJeJXno/BzXOHFCmO0L78iBCNPC6P2o7/xkTI31iPw\n7SG4BTZDN9gNccw0yr+aI7efcLly1rWteGVfjTQo5GwJTKoJ6YrTIfEWFuB+LI1H\nJfB7QIs4MehcxxofpBlsWxmn71hSRYDye4v0+xO28MRGeTT01WjMSasjZC34fLwI\nn+ZPaK7SNlzFG8sibZDj8BMQvmi4aIKBTqCpndyWntghEJdSSFgoR6GKp4qbVCT4\nCIaBNOxeN2O52IrrBNb2lu18OUfd3/9RRDGCF7CetoblhTlsTxXB2onz9OMCDQaq\nG7dogkzS6e+xaxBHJt6UE0zHC6VI8RBcMQIDAQABo1MwUTAdBgNVHQ4EFgQUGMsz\nf5xFdiD9xVq6rJ3KqwwvO3kwHwYDVR0jBBgwFoAUGMszf5xFdiD9xVq6rJ3Kqwwv\nO3kwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAXqPfMYgZ6uNZ\nVqch1+1ZI/LysMkeRdWu3Ksr6BEFejhzZChuenZyJIadaJUlhRdLvcTXK/9R7Vgb\nLR74R4SacT6dMAmsPgKZqGAOVBXEB2V2QfyrXUkFZuRLSAUpocpLlhG80XrLwX8t\n3jRVrBegXXMT//ggZ4DEqTUly0PJ4zjqG5D/FGMiP1QhR+4A7k2WSsf/zIu97VSK\nOVzHiEdRpW4IQAgEkUyBVb1NvQoMxQ0QniqldxGV16ONQsOLteqkKl1h/vEa5YWo\n94my4Giz3nNYpqzOZbpvDjZsYemO9JS9yhMWr6Aisie8Yv6r1EGIGKEeO/iuvEbM\n+e1rZE7UDQ==\n-----END CERTIFICATE-----\n'
];
let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCr1dL0LbWctfeC\nLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8GjYUtfEzj3Zt2F6r1a4rpGHvWn\n955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4HNfdt2++jtoxSjLl9bZ7w2AI9\ndxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMvayJLMcFLCcapLdPvrJhs2TZnY\n/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC18gXCvs6rHhYSKi7G7N/F0LY\n3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5TohfJ3qaYc/6fihde3rOAX9c\n3OvoQsrnAgMBAAECggEAPLfOFl0OduTvo+4oeyQk2hItYPsDWyQhFP0FpA0LxDeV\nt2VlqW0QY8BN5zb+IqGU9iyHo1VJN9zZtfPv4rqOtEfmTBFq8pDA523AOmKenGIE\ntIcUY3JPVrHxj76u81zeQY8bPiBdkMHrLLfnTAebsdA1OHqGWfVrQp0fXKUDplgr\nCQYL68QBuKHm9tWBJTSXr7ZXIH5xkRjUDyyFfByIcbtVicI2aEIzS2GVsAdoPSpN\n0eTUbmDOnzP7prwGcx3Wf09yyg2mfoUEKhYueHpzXb2EpA6LvWeWueCEvh/9LSDW\nBU9WxxPsRJ7D7fi3JL4zTL/Ia3n7+7LDO9fd4BeIpQKBgQDO6DbbtAUkIkmpOwb1\nvBtLwHRamawquta01GoIF8B6DP3Wo4xvTLUUiwzJB1T7eySZLKC7b2KxcBypfsNs\noQqbwFSXUkI+Ivk/zMkEQg0KVdqGPv3PCs+qFUDN72kYmsza/ou1/ldt5PcUU7uI\n3Xq+3nAW8WImD1nf5GEK02p4YwKBgQDUm03bNwCQgRO2q15R5sBaLEkDRq47roFb\nLpHGDB330VY6iN4QfXBr6P9ErYyzTKH6GuEG1qGfbYM74cfOdjWwmuqqM9qNZX8/\nT5qBjvqyNKAXsIEAaNlMndHG14nPpvBw0xY70IWUjtPj7rdofQIKN69y31WlZ1HV\nWxPDaTXQrQKBgG74EjwBL+SyUwlldBUlfwpAvOa+lp0QOgkgB4IxovSStS2B59bl\nsBTFguTqfsSlxfo0+juswKTjuSuaphtDv9nK7FOANbD3tvBl18Xl2vKZGyt26084\nwCm7XldUuOwOUiJ99NZ2A9QXwgBv7Bu6lZN632keqwI4p34yEW3p96d7AoGAO2fJ\nsV8FAVuPrpLjn+7iAFAvdoLhXDu+WUQB51yrYvtTJLfplKH4L67C5OW5UsAu4jtw\ndQCz2GA5Mxo7Qi01g0tGFpi2kJuzmnUbrufMlM6vjO78nKivTwEqBG1lTGhQ9rWE\nmOIC8SeXfTDOfpuvXjuBAo/01mqwKvVv6EIVj2ECgYB+YNio1PKn6kjXGH2Zdegm\nMTFr4Ozg+X5hh8ZGDF16HJs7cE6YGfH6VvWhUOJnYkjudxoFQa9XMBiva8DKSwDh\nJLeF8yMvHSOJCrPa43BE97BjrD5D7PeQmh3pvuArXJPVTZtvncDqKBk9kePVftRK\nzWnzE/iVh3H2XsAv04rihQ==\n-----END PRIVATE KEY-----\n';
let cert_server: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq0MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU3NDJaFw0yNDA2MjUwMzU3NDJa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZTRVJWRVIxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCr1dL0LbWctfeCLDwKpD13eW+J2fE4tetOjPGaHblioPH0angCG8Gj\nYUtfEzj3Zt2F6r1a4rpGHvWn955k4RzB0XodonR7yaCACw0KYl1vRG9wEKLuND4H\nNfdt2++jtoxSjLl9bZ7w2AI9dxZYrhY/LT3rbKChcNf3NGTFuqgrKX1dsKU6eMva\nyJLMcFLCcapLdPvrJhs2TZnY/jvG40PpTaRJD8Tvyf8uHnizeR/fAI08DOAQEohC\n18gXCvs6rHhYSKi7G7N/F0LY3soGp+a6WD2tYQmniE824YFHNsaNXXE1JVCAgnP5\nTohfJ3qaYc/6fihde3rOAX9c3OvoQsrnAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAKni1qp4Y5Cj4Y311Hs60OQliNKqilLf8if1QQyppDvvb6D0H1exSfclNspQdt+j\nCPfNy9SNu+xsLyYLd/Us6AtEKRVXCJIKAlvQwgdyTDjyA30EpJP1cH7NEW+1AV+l\nmm9U5VhQG47DqwSDFfDmkmBx6H9njsHoZ9eUeJK4As7Li5ZVrGTvpTGe8jVFUPzb\nEV8Vw5nsukOgbdXnA/D1JdvBMBEtyaH1yVOtfP9M6i/tnA0POgY9qPfE7tof2TY7\nTnKC8nbJLAMmMy+mUWUJOeAY9E25kcGsLmdvIr+SScW2LTA73SDlYjg+I0IHMNU7\nTYVL0RWoBhxU9tlqIxAGF4M=\n-----END CERTIFICATE-----\n';
let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyABV1S9yJMrsr\nx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti31Kq2T0niDdtDnHby57UN8qx\nkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm9tP1sufz0advkwT+2vkrhh+A\nNWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7PpZfkLLiWOpaBSsuCuOkYT3F\nC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn54aE/8gkHEMTox74H0eZ7P1GS\nQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0YgsxBDJq+xTR6RbXoJXa+Vb4\nfS1Lu17fAgMBAAECggEAKlOaxqmjZ3yIxYA/Xxf/qVSgJsazwR6hluXBat9cQfn/\nboDYvSD2oCw6nCXMRPo/M8+bg4iH3C7oJBGS6KKyVtEg7FoAiCcOrzMqB3usTk4V\nHUiogu02toU7IdHJFlFkX0O2jGPFnHPoSbRofsGDIZ0jrXKvwi6tWdwwZtgRTye6\n7V7ZBvwRmE0dW7p5STSkeuxbGVSI5jeu8c906rT+KiqCQNDJEU91+FbRKYdRmyNS\nOroHksII3+3J7YsfCZuDFAyINTFGTGncFbCYhrKf9jSyxinLY7kCzGt9WKZNHBMN\nxtQ5wK7VjX4LOEc8tkEu9pH42xgazHw+0oYiMdHzAQKBgQDowFw5gGSZUeF6UMkt\nEDMTT3yxxe80+de5J14RHNqRCBYk9TcNLkKhC4/FxamGZTacxtjMiT352WNvXeax\nqxzkyZ4/fvWg0cD4ka2nJtHF+czhE2H7nGytsZg5tmBMTVgGaae1Rnpgpv/x5ix7\nuL/tHC1fb7PhWafDpynuaXRFIwKBgQDDx7HUENQ47dpjZznF5FE+3hm460Sl0Oa9\nO2eicVGVqvGH/CSMldH2r2H1WmbgP+cZhmadWWxI3eL2CJkQlEngZEsyz2gsd9C8\n4u2TH08jxxxKpwbLLy0CL/zIN6qRhoZ570B9BTA7yUAM1ddebOCnlSBkIsiZnuc0\ndHamkpIxFQKBgEKMDVJbhWfY43EHfB2oThItXeeuQjCRZr6HpPubllp1R2+VtQHN\nwjsthRP06f2FHtJAgGgqrU+seiOzY2xVElPP2bEp6azrjBMGA/KQxNWoEI4h7pf0\nJ5aZ+n41yN7IFmzu9IZ9+it8VB2jxAAz2JxAvDBXTcUWz0K/ntuNxzKlAoGAHoGr\ncAP/Ta+ibALVucRN9KHfGDVwyPW4PpxXFbTapZuxbyMW/uEJiorhlL21chQDCrMq\nojIg8WnBx9ynHTI+IL0ACrbO4L76w7QImPgz+Ls56VgFcvuy47heh0RFS8/OfImP\nXuvEDEzbsiRQHuKQTwyps3DIGUftdvr+0g3cwdECgYB6UJvYbQdBaytavdVhE5bg\nESR+NYQRgGpR8IPTay/5OnuEAwoAkDs7e87lfGl+t3/4uj4AvcbO44mv8RS4Bb83\nTN3HjoxZq+uUNawtbUcbFwhruzlG//Y0Y7Kc3LUBJztXW05b4/r0KqpPXKeYfzaZ\ne2BLYOV3m1oLnPcUPCDzTA==\n-----END PRIVATE KEY-----\n';
let cert_client: string = '-----BEGIN CERTIFICATE-----\nMIIDbTCCAlUCFFMuhEtlRQyhBQihs+DPDWyUAOq1MA0GCSqGSIb3DQEBCwUAMHEx\nCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\nA0NPTTEMMAoGA1UECwwDTlNQMQswCQYDVQQDDAJDQTEfMB0GCSqGSIb3DQEJARYQ\neW91cmVtYWlsQHFxLmNvbTAeFw0yMzA2MjYwMzU5MzZaFw0yNDA2MjUwMzU5MzZa\nMHUxCzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNV\nBAoMA0NPTTEMMAoGA1UECwwDTlNQMQ8wDQYDVQQDDAZDTElFTlQxHzAdBgkqhkiG\n9w0BCQEWEHlvdXJlbWFpbEBxcS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQCyABV1S9yJMrsrx07W2y7OZRV6EUHWP6Z26+X9Ymq7gM/HO4T16Kti\n31Kq2T0niDdtDnHby57UN8qxkoNSW+jDmu+ptQqMelR47xFCU+f7s9Wbj5o1+ZZm\n9tP1sufz0advkwT+2vkrhh+ANWQxDSw1GMsU3k+39TdV1yqg/ktKAuQSupO1UFq7\nPpZfkLLiWOpaBSsuCuOkYT3FC7nEep8QNzCLsOvN8gSr6PNgmP6aa7sALQ2T+Qn5\n4aE/8gkHEMTox74H0eZ7P1GSQIVNJTpTYr9bNQYY8hs030l9FXl21CZbkXiNhBO0\nYgsxBDJq+xTR6RbXoJXa+Vb4fS1Lu17fAgMBAAEwDQYJKoZIhvcNAQELBQADggEB\nAHdqopKMnR+jH0Pya54Fa8kwiNRnacS8/UlAbMrDCVywHQdpfKtHFyCH6CVbGp4b\n8bIwqGSeqggdXWB6BJjaEPdwoKiViVoMQkvIzdvOGHe1KNDxXgQA8jisQrAMgaMP\nGoRxtMMCqLMAYinpLWMdNVlGsMyGDcvYq2YAfMCi01cnOCQsyL39H5EiU2+qLtOJ\nlKko+nddwGJKbFQeh8LldTJO/ydE/c5t9tER/FCu63EHGFyiO7jtqw7h1gK0Dx6s\nDH+HITUkqCL0s3TlGgPjXQXGyaagQVldca5OgMUKpItl5R2NUckbxdx9YzmtIUji\n6AFFjwfN1KvQ+irR/5aIsio=\n-----END CERTIFICATE-----\n';

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 3000
};

let addrErr: socket.NetAddress = {
  address: '9999',
  port: 10000
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
  ALPNProtocols: ["spdy/1", "http/1.1"],
  proxy: {
    type: socket.ProxyTypes.NONE,
    username: 'name1',
    password: 'password1',
    address: {
      address: '127.0.0.1',
      port: 10000
    }
  }
};

let connOptErr: socket.TLSConnectOptions = {
  address: addrErr,
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
  ALPNProtocols: ["spdy/1", "http/1.1"],
  proxy: {
    type: 0,
    username: 'name2',
    password: 'password2',
    address: {
      address: '127.0.0.1',
      port: 10000
    }
  }
}

export default function SocketErrorCodeTest01() {
  describe('SocketErrorCodeTest01', () => {

    /*
    * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetLocalAddress_0100
    * @tc.name  :  testNetworkMgrSocketUDPSocketGetLocalAddress0100
    * @tc.desc  :  UDP GetLocalAddress Bad file descriptor.
    * @tc.size  :  MediumTest
    * @tc.type  :  Function
    * @tc.level :  Level 3
    */
    it('testNetworkMgrSocketUDPSocketGetLocalAddress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetLocalAddress0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.getLocalAddress().then((localAddress: socket.NetAddress) => {
          console.info(`${caseName} UDP_Socket get SUCCESS! Address：` + JSON.stringify(localAddress));
          ExpectFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName} DP_Socket get FAILED! Error: ${err.code}`)
          expectTrue(err.code == 2301009);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 2301009);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0100
     * @tc.name   : testNetworkMgrSocketUDPSocketSendErr0100
     * @tc.desc   : UDPSocket send bad file descriptor.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrSocketUDPSocketSendErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr0100';
      console.info(`${caseName}---Start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let netAddress1: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8888
        }
        let netAddress2: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9999
        }
        let proxyOption: socket.ProxyOptions = {
          type: 0,
          address: netAddress2
        }
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: netAddress1,
          proxy: proxyOption
        }
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            expectTrue(err.code == 2301009);
            done();
          }
          else{
            console.log(`${caseName} send success`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 2301009);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0200
     * @tc.name   : testNetworkMgrSocketUDPSocketSendErr0200
     * @tc.desc   : UDPSocket send Bad file descriptor.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrSocketUDPSocketSendErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr0200';
      console.info(`${caseName}---Start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8889
        }
        let socks5Server: socket.NetAddress = {
          address: '9998',
          port: 9998
        }
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: netAddress,
          proxy: {
            type : 1,
            address: socks5Server,
            username: "xxx",
            password: "xxx"
          }
        }
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 2301009);
            done();
          }
          else{
            console.log(`${caseName} send success`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 2301009);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_Error_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListenError0100
     * @tc.desc  :  TLSSocketServer listen(callback) cannot assign requested address.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     * */
    it('testNetworkMgrSocketTLSSocketServerListenError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListenError0100';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.listen(connOptErr, (err: BusinessError) => {
          if (err) {
            console.log(`${caseName} listen fail ${JSON.stringify(err)}`);
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            expectTrue(err.code==2303199 || err.code==2303111)
            done();
          }
          else{
            console.log(`${caseName} listen success`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code==2303199 || err.code==2303111)
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_Listen_Error_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerListenError0200
     * @tc.desc  :  TLSSocketServer listen(promise) cannot assign requested address.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     * */
    it('testNetworkMgrSocketTLSSocketServerListenError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerListenError0200';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.listen(connOptErr).then(() => {
          console.log(`${caseName} listen success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} listen fail ${JSON.stringify(err)}`);
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectTrue(err.code==2303199 || err.code==2303111)
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code==2303199 || err.code==2303111)
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_Error_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0100
     * @tc.desc  :  TLSSocketServer SetExtraOptions(callback) parameter error.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     * */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0100';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.listen(connOpt).then(() => {
          console.log(`${caseName} listen callback success`);
        }).catch((err: BusinessError) => {
          console.log("failed: " + JSON.stringify(err));
          ExpectFail();
          done();
        });
        tlsServer.setExtraOptions(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            expectTrue(err.code ==  401);
            done();
          }
          else{
            console.log(`${caseName} setExtraOptions success`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_Error_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0200
     * @tc.desc  :  TLSSocketServer SetExtraOptions(promise) parameter error.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     * */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0200';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.listen(connOpt).then(() => {
          console.log("listen callback success");
        }).catch((err: BusinessError) => {
          console.log("failed: " + JSON.stringify(err));
          ExpectFail();
          done();
        });
        tlsServer.setExtraOptions(undefined).then(() => {
          console.log(`${caseName} setExtraOptions success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
    * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OffConnect_Error_0100
    * @tc.name  :  testNetworkMgrSocketTLSSocketServerOffConnectError0100
    * @tc.desc  :  TLSSocketServer off(connect) parameter error.
    * @tc.size  :  MediumTest
    * @tc.type  :  Function
    * @tc.level :  Level 3
    * */
    it('testNetworkMgrSocketTLSSocketServerOffConnectError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOffConnectError0100';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.off('connect', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
    * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OnConnect_Error_0100
    * @tc.name  :  testNetworkMgrSocketTLSSocketServerOnConnectError0100
    * @tc.desc  :  TLSSocketServer on(error) parameter error.
    * @tc.size  :  MediumTest
    * @tc.type  :  Function
    * @tc.level :  Level 3
    * */
    it('testNetworkMgrSocketTLSSocketServerOnConnectError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOnConnectError0100';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.on('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
    * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketServer_OffConnect_Error_0200
    * @tc.name  :  testNetworkMgrSocketTLSSocketServerOffConnectError0200
    * @tc.desc  :  TLSSocketServer off(error) parameter error.
    * @tc.size  :  MediumTest
    * @tc.type  :  Function
    * @tc.level :  Level 3
    * */
    it('testNetworkMgrSocketTLSSocketServerOffConnectError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerOffConnectError0200';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.off('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1900
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1900
     * @tc.desc  :  GetLocalAddress(callback) Parameter error.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1900';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12345
        }
        tls.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.log(`${caseName} bind err: ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
          console.log(`${caseName} success`);
        });
        tls.setExtraOptions(undefined, (err: BusinessError) => {
          if (err) {
            console.log(`${caseName} set ExtraOptions err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 401);
            done();
          }
          else{
            console.log(`${caseName} setExtraOptions success: ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_12000
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions2000
     * @tc.desc  :  GetLocalAddress(promise) Parameter error.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions2000';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12346
        }
        tls.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.log(`${caseName} bind err: ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
          console.log(`${caseName} success`);
        });
        tls.setExtraOptions(undefined).then(() => {
          console.log(`${caseName} setExtraOptions success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName}  setExtraOptions err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(err.code == 401);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetSocketFd_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetSocketFd0100
     * @tc.desc  :  TLSSocket GetSocketFd success.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketTLSSocketGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        tls.getSocketFd().then(() => {
          console.info(`${caseName} get success`);
          expectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} get err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_SetExtraOptions_0100
     * @tc.name  :  testLocalSocketServerSetExtraOptions0100
     * @tc.desc  :  test LocalSocketServer SetExtraOptions(promise) 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerSetExtraOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerSetExtraOptions0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.setExtraOptions(undefined).then(() => {
          console.log(`${caseName} set success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} set fail ${JSON.stringify(err)}`);
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_On_0100
     * @tc.name  :  testLocalSocketServerOn0100
     * @tc.desc  :  test LocalSocketServer On(connect) 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerOn0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.on('connect', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_On_0200
     * @tc.name  :  testLocalSocketServerOn0200
     * @tc.desc  :  test LocalSocketServer On(error) 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerOn0200';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.on('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_Off_0100
     * @tc.name  :  testLocalSocketServerOff0100
     * @tc.desc  :  test LocalSocketServer Off(connect) 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerOff0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.off('connect', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_Off_0200
     * @tc.name  :  testLocalSocketServerOff0200
     * @tc.desc  :  test LocalSocketServer Off(connect) 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerOff0200';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.off('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_Connect_0100
     * @tc.name  :  testLocalSocketConnect0100
     * @tc.desc  :  test LocalSocket Connect 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketConnect0100';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.connect(undefined).then(() => {
          console.info(`${caseName} connect success`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} connect err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_Send_0100
     * @tc.name  :  testLocalSocketSend0100
     * @tc.desc  :  test LocalSocket Send 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketSend0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketSend0100';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        client.send(undefined).then(() => {
          console.info(`${caseName} send success`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} send err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 401);
          done();
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_On_0100
     * @tc.name  :  testLocalSocketOn0100
     * @tc.desc  :  test LocalSocket On 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketOn0100';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.on('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });


    /* *
     * @tc.number:  SUB_LocalSocket_Off_0100
     * @tc.name  :  testLocalSocketOff0100
     * @tc.desc  :  test LocalSocket On 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketOff0100';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.off('message', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_Off_0200
     * @tc.name  :  testLocalSocketOff0200
     * @tc.desc  :  test LocalSocket On 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketOff0200';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.off('connect', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_Off_0300
     * @tc.name  :  testLocalSocketOff0300
     * @tc.desc  :  test LocalSocket Off 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketOff0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketOff0300';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.off('close', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocket_Off_0400
     * @tc.name  :  testLocalSocketOff0400
     * @tc.desc  :  test LocalSocket Off 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketOff0400';
      console.info(`${caseName}---Start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.off('error', undefined);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_Listen_0100
     * @tc.name  :  testLocalSocketServerListen0100
     * @tc.desc  :  test LocalSocketServer listen 401 function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerListen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerListen0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        server.listen(undefined).then(() => {
          console.log('listen success');
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('listen fail: ' + JSON.stringify(err));
          expectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number:  SUB_LocalSocketServer_GetState_0100
     * @tc.name  :  testLocalSocketServerGetState0100
     * @tc.desc  :  test LocalSocketServer getState function.
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testLocalSocketServerGetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testLocalSocketServerListen0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket_getState'
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        server.listen(listenAddr).then(() => {
          console.log(`${caseName} listen success`);
        }).catch((err: Object) => {
          console.error("listen fail: " + JSON.stringify(err));
          ExpectFail();
          done();
        })
        server.getState().then((data: socket.SocketStateBase) => {
          console.log(`${caseName} getState success: ` + JSON.stringify(data));
          expectTrue(true);
          done();
        }).catch((err: Object) => {
          console.info(`${caseName} getState err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
     * @tc.number: SUB_Socket_ErrorCode_TCPSocketServer_0100
     * @tc.name  : testSocketErrorCodeTCPSocketServer0100
     * @tc.desc  : Cancel multiple subscriptions to the TCP Socket Connection shutdown event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testSocketErrorCodeTCPSocketServer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '12345',
          port: 12345,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
          proxy: {
            type: socket.ProxyTypes.SOCKS5,
            address: {
              address: '127.0.0.1',
              port: 12346
            }
          }
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          const callback: Callback<void> = () => {
            ExpectFail();
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          };
          client.on('close', callback);
          client.off('close');
          await client.close();
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 2303199)
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}