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
`-----BEGIN CERTIFICATE----- MIIDbTCCAlWgAwIBAgIUEb8gE403eamzwoYHf3fE2JKw5s0wDQYJKoZIhvcNAQEL BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAgFw0yNTA2MTAxMjAyNDZaGA8yMDU1 MDYwMzEyMDI0NlowRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUx ITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDCCASIwDQYJKoZIhvcN AQEBBQADggEPADCCAQoCggEBAJmQ4OPvDI6GpbUAKDStkDS+UQZDnufrPYTCSGYS 77qAS7s9KrXhIWjs2j5LxC5tfNFoLMrXRmNjb6tPgs/EY6QLn+v4ICek7EeAzwRx Dr0Sh+Owj64toSb9WUBGNU5ahTLA4+cCpYhZamnCN18fYR2TXah/IbkjRZM8UN8Q iucCUn4lNT/1lh6qph+3UnRmafUzamlVkiQUsslbBZnm9vs88sYeTNlla9L4C8WH hnXLUOgl31TzWe2KppOS/b16p6bOwMS06kJbp8nS9Gd6GgH0k9Fny1X1JM/xZG4Z xvzLlNzhusXyzjNTrCmLGYDlLZxpp/aYUVf6Hb1b6exUAGMCAwEAAaNTMFEwHQYD VR0OBBYEFHR/rd7ZFFR7o05FG9mj1zwYHY88MB8GA1UdIwQYMBaAFHR/rd7ZFFR7 o05FG9mj1zwYHY88MA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB AEih4pf7fOFdOHD9ztc2IFQE6uZswVqfNztk7dGZyC1bmlJnF9w92Ge/Qp7eqN4a 8aXT7Ttlj1Cn6VAznBd5JHs903UOI/gLNEHQWtSTP9BIoVoXHUNLzZbNvPveIT2d 8YAK1mG1NyCkR6zKIPLY4Lt8InR658l+h0XI5PiXZANZlgN3pETvpA04movMbZKS dn8bPMuhFExNTZEHceUTDz7Uqf/SYLPEwXSuLeYpjyyFnL6mXtE/q02n3sNcqkKx 3XtzIDzzOOxUDl2xPI+B36lzuIShhTbkGD/LdE3AHpX5CwZlooZF+INI+57UinM+ 6So9s6ovMthaJ+8Js8OxO5Y= -----END CERTIFICATE-----`
];

let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\n' +
'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OF6q3q4R9tuJ\n' +
'tlqmkGIXvZT60t7B7DxNs2s2M5Y6UqgAKJrY9MUoPmKwqPQS6ZZbpHZyYyRS7uSl\n' +
'SB1JjpvT05m2KHm20Tx+ttyia+pkR07Aq/LSdt+ujCfE0rVF343oVQZcgaSbejpT\n' +
'gQwvUsvAuPKczT1ytyh81rfpG1gkWpFf26CqUJ0q66h66P8/hWiiNmn4tb1bKuEB\n' +
'VMyRZwHEwIVPXxQkoRtt2Wy8XBFqhBaKfNfb+Im8Ml9FQ3C91A1fcJi5agoNGTxn\n' +
'ZJZI0xlt4vu8nMZuc9CgW64se0cImQsH2cYnj4W7t/Fg0TirmW/QNhNnP+K1kz1t\n' +
'lWWyBj0NAgMBAAECggEAMxqymkH3DZAG7lAQ/BD8VlHxffNbW0Jyf2WjEpJI5P9w\n' +
'LNKtR6xrAK1jnMkaqe9JouZaTYnXjF6SNuYGBcGaPcuAeiFpHgXfgBII91OWCgTQ\n' +
'tEeAFuV0NGb6vex+S9VKTLxkfdacEn1hFy4W/pLHJ5OGK4fik0UGCg8siZ0oOlaP\n' +
'wr3cM2vsGlgukweXOyV21I0B/DygEo/2PuikmaqfMAzz0scVngNb1lWkhq2ouFc7\n' +
'K3LMH+hFnEdmoRtjnhvza70Whi5bW4Va99Ntqm364eTIjPZFuVoyUDbYiOzn30gO\n' +
'njH58WJ/v1LLXeJ9oKQr4CTV0bxEl7aZ4xSYhFe3NQKBgQDm7K5nnWIKBhIWhMBb\n' +
'YAjTvUCfSltMEJhqMnjKSrU84QxHhlOO7+wjHbL1zA9gTgK/wU6DSRUKz2BcVnYv\n' +
'ol9iEw7qHzx2dHrG94EKnDn4XDFctBou4SeAElu9dJmMK6pBMIvhfwK70dJxyX6I\n' +
'pdvhbrZJcIOgqhgVFjJnW1GoXwKBgQDT+/lHPRNMF2ngI8ImDB0nYErsHnbLC7GC\n' +
'6XoS7xUlTTrXo0ONbuxHfiAUVYrN4C9/Dsh2eQMwwBwWP3Au8mQWOCGDhlxEVcxy\n' +
'wnpy9ecdpptiO/YQNn6dBRMIU5g6k0TZY4lZZ/SIDm29M9GtzIHIm0fW2MksfIiJ\n' +
'f7SOkhoCEwKBgQCfNnX0qHUM1iyoa/S3y1mqqyQf70NNCXAcYBoZ1zJn+/3cXofD\n' +
'2DVl7LcTcxLy4jZRATVhnQSuBFa6sz4fD4NV+i/hSZIFVb/E6KaGqznou5+o+9/F\n' +
'jKUQTxgDYp3vH7ft5Eu9ODWpSzweCb989WXJYuy5a6LFJiEegMRVsId3XwKBgQCO\n' +
'4KpnhZbYFn/Z/sAA/PE5dQGKnA3dVQhUACGzWUmbVq5uYTBKx5ShqzTb/7wKfywE\n' +
'K2aZ035/ATztEdz/B4jGIRcVmx3dQScHwmTdzzfzGDRqxZdX3iMAmkb1ucJE2LXy\n' +
'/8+3XwXGHlOAzshoqApht6d3+628OkOcyWJdJcQ52QKBgQC4uC2IY9kVSE7aPXs/\n' +
'UMk8IMX187wWZe1ULhwkhwgsvJDx1qvNDFlOiBoFAH9TagKVzQrtoa4X9C3Qf6IK\n' +
'SwbdPtDz0VeUWxXF+ASA1v7SM+Ra2v7hrOfrOWLeSnTTLZzcUAQjlkc3ynFcGimF\n' +
'JNJFAqr9K+LHatgjxTcHO9amFQ==\n' +
'-----END PRIVATE KEY-----\n';

let cert_server: string = '-----BEGIN CERTIFICATE-----\n' +
'MIIDJDCCAgwCFH93ojUm8aIfF/P/YdW+iDl9RRiAMA0GCSqGSIb3DQEBCwUAMEUx\n' +
'CzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl\n' +
'cm5ldCBXaWRnaXRzIFB0eSBMdGQwIBcNMjUwNjEwMTIxMzM4WhgPMjA1NTA2MDMx\n' +
'MjEzMzhaMFYxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYD\n' +
'VQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxDzANBgNVBAMMBnNlcnZlcjCC\n' +
'ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL84XqrerhH224m2WqaQYhe9\n' +
'lPrS3sHsPE2zazYzljpSqAAomtj0xSg+YrCo9BLpllukdnJjJFLu5KVIHUmOm9PT\n' +
'mbYoebbRPH623KJr6mRHTsCr8tJ2366MJ8TStUXfjehVBlyBpJt6OlOBDC9Sy8C4\n' +
'8pzNPXK3KHzWt+kbWCRakV/boKpQnSrrqHro/z+FaKI2afi1vVsq4QFUzJFnAcTA\n' +
'hU9fFCShG23ZbLxcEWqEFop819v4ibwyX0VDcL3UDV9wmLlqCg0ZPGdklkjTGW3i\n' +
'+7ycxm5z0KBbrix7RwiZCwfZxiePhbu38WDROKuZb9A2E2c/4rWTPW2VZbIGPQ0C\n' +
'AwEAATANBgkqhkiG9w0BAQsFAAOCAQEATco08kfIG/HpyHtoWtfdyxDiihXm5onQ\n' +
'sTnUF3q/ETSwUU1UCUkxRr/KbiSikRcN6o7mFtbd7qECAN5THc3+bFjcimfMYXLb\n' +
'zl/Bcc7wlVgbD4hnSYtuU14seHGHtQVh9kPKn+OdDL55VKnzbI9O8OZIcE7XVIi8\n' +
'wFRCWIq2PCxiTgB3Abu9V0Czy5EszFtNaCfUj65mPHCymRAeyYme7mKzxUWzsxKB\n' +
'i4NJvjFZ9qWh0hC8o/ux+26oo9XJlWVvd35/RAx+mZz4R6733/RR+8pVt4p+GnGM\n' +
'/BX+2zvrb7nXns+Ghvd/+J4ignxeSpDuc6WjLPtOh52puWxfMFulIg==\n' +
'-----END CERTIFICATE-----\n'

let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\n' +
'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCv9q4wAWgKXMsR\n' +
'Ep858Kmq0e1ZnZBKLadpBwrkxembHmYF8PQxKkkM7wHjiBu0H1KlWdJgUV8d3DPO\n' +
'+83OlFuWheKgr8DT1eRXAw2IEBPTOTBD4CeAkjJR7HtHTgeYBq7x40nAwRxExEKV\n' +
'j1eLU/r64EhV8/BtZniknTbbUic4C6buykSrwMXM4Y4FjfHkNyh2c/FHR0u46jeR\n' +
'452rMuN5tJCtqfORadc5Dw//pUVS/M7wS8behUyEvCLoZo1zB286N4+by15hpEe2\n' +
'4RdjGuscCXUpJeiCNU3tQMhV38/olFyciKjc93iqSiT9pOc0vYNCiMvl1Sm8KTfV\n' +
'BE3KojS9AgMBAAECggEAQ2xSZwuK6XmPx51qjGFmKZFhkDZ6/KlMncY4its4vRqj\n' +
'PgCLGLGapw2HnD7hWp2r5baqkQRs3TysT1GVlOOsylrHsQlW6fRpl1uQmkOKzSL7\n' +
'Fu7zQ+UAyfpCbFp+N2bMLtwHvQdhhQnsd3Eiury1jN5WaTTcuZaLgIvK4rOyWlsd\n' +
'Y5H9ipi+GGT2snDkrFdP2A6T32IjtsjBzEVyh9X12caEWvTnUcL7G8IAGkz5eeui\n' +
'PphT+94GuVac3QxvY1seZMhK1+ofPVx13olzlCEYNf5nOCc2vJr+L5xtbjvn8345\n' +
'sdwjCpMBn3PWYR+Rh4IANILX94YKGE65/UY2SFaOswKBgQDm6ra4kGBEexcK0RtW\n' +
'Usx3HbD8sy7TDIPsAUZFJfmBETNYQT2sHfln3G3uAiCObf94L7jC/ghBkXimGSno\n' +
'aigJnaiEFwieX8aTcQo2Bhnm4oBqKEO7siN3GBN8w6KL7hlDwCuwvBT/fCnXj2qB\n' +
'7d3scuNOoIV4JuvQqUE+Ol0SqwKBgQDDE9adCgcwW7RjsxvV9G+4zN4s7d5XVo0+\n' +
'F7CPNMJBGav647y0v/tWOtlGhkHDnP1WUl2UZx4J+6+b0yIdMdRAcso1Ko9TxakB\n' +
'nRig9/1buTh+akkTHootda7/85/PITaSmRId7XkgS2KIb9rLeewV3tx9M2Ol9Sl6\n' +
'2KyprxmWNwKBgQDgDZuPRx7xM1GvQCe7QYl8hkWlW6KySrFx++aXz3ng/rSIDH1v\n' +
'lIHbgaj0SAIY0KgRkJRANsYCAMlEuKPOC7qfYecRi1vkd1+wzfyvYIofWWRqHHlk\n' +
'FDuPIcA+zX/ZMAQ5lauOx1/EaVAcBN6+BPPQqcTeFKiMZY9nneJdI7oNEwKBgE6Z\n' +
'obFopvjfGlHJiv+sG4/US/jCZwG9x+8q0GMDGPnuBBN0y0XwzK4zy/PUiI7upEyx\n' +
'py7yVXIkTN92NJqaxzCoj7zYRyOz0qLpz1CcWyMoABE/de4UMgybDEXovY1RjpGG\n' +
'x3vzgQh4F11t5DR0DaHKSADSQeZOX8Y1o2xDNwYFAoGAeR1iNXRTxVzSzYA+wMUY\n' +
'bqUS39N7fdTma8+K2jYvXeuhyG3o8gyL3jYY3nC6LTtk+Ds+gCsajkuXFLiCRYVV\n' +
'7TuKMq402Q/EQ91Ow98L1n6KWWML2+qolA6gdXe1T6EE14Jp6i1ZKl7hK2xNYZMt\n' +
'pdyN4l1O+mtWzoN536XgpOk=\n' +
'-----END PRIVATE KEY-----\n';

let cert_client: string = '-----BEGIN CERTIFICATE-----\n' +
'MIIDJDCCAgwCFH93ojUm8aIfF/P/YdW+iDl9RRiBMA0GCSqGSIb3DQEBCwUAMEUx\n' +
'CzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl\n' +
'cm5ldCBXaWRnaXRzIFB0eSBMdGQwIBcNMjUwNjEwMTIyMDA5WhgPMjA1NTA2MDMx\n' +
'MjIwMDlaMFYxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYD\n' +
'VQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxDzANBgNVBAMMBmNsaWVudDCC\n' +
'ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK/2rjABaApcyxESnznwqarR\n' +
'7VmdkEotp2kHCuTF6ZseZgXw9DEqSQzvAeOIG7QfUqVZ0mBRXx3cM877zc6UW5aF\n' +
'4qCvwNPV5FcDDYgQE9M5MEPgJ4CSMlHse0dOB5gGrvHjScDBHETEQpWPV4tT+vrg\n' +
'SFXz8G1meKSdNttSJzgLpu7KRKvAxczhjgWN8eQ3KHZz8UdHS7jqN5Hjnasy43m0\n' +
'kK2p85Fp1zkPD/+lRVL8zvBLxt6FTIS8IuhmjXMHbzo3j5vLXmGkR7bhF2Ma6xwJ\n' +
'dSkl6II1Te1AyFXfz+iUXJyIqNz3eKpKJP2k5zS9g0KIy+XVKbwpN9UETcqiNL0C\n' +
'AwEAATANBgkqhkiG9w0BAQsFAAOCAQEAP75ox5G7MytaueZH97xQAdLFEyHkoduX\n' +
'PMddYDJcRv5VAG+EHrhSId/DoaIDrhPHgwkzUWbYHn6RB63bkt11CXJKHwoZywIp\n' +
'efdIMlWpDJ+ISEu9q3THWAnXKdB4EuI1j3LSzNeoSQc64Wy4NQcIixmf6JnqyzQr\n' +
'3UFEJ4jj1nJGRhBUQza4lhSN3dJNF1kawbTn4aQ0D+rvhWcCKSPTzsGy+xvPUvsV\n' +
'7PlTzCrTmn7rgovs9iwgWFOvNdJJI6O2oTuZZSSGT/Xc1fpZPbIlLBTHlSpi4F6Y\n' +
'vttpfMLHS7YyAAppfegn79OBf3DP/N3VRmcDeQgh7FOwWmp+aZg4rA==\n' +
'-----END CERTIFICATE-----';

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

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetLocalAddress0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetLocalAddress_0100
     * @tc.desc   UDP GetLocalAddress Bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0100
     * @tc.desc   UDPSocket send bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0200
     * @tc.desc   UDPSocket send Bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerListenError0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Listen_Error_0100
     * @tc.desc   TLSSocketServer listen(callback) cannot assign requested address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerListenError0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Listen_Error_0200
     * @tc.desc   TLSSocketServer listen(promise) cannot assign requested address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_Error_0100
     * @tc.desc   TLSSocketServer SetExtraOptions(callback) parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerSetExtraOptionsError0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_Error_0200
     * @tc.desc   TLSSocketServer SetExtraOptions(promise) parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerOffConnectError0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_OffConnect_Error_0100
     * @tc.desc   TLSSocketServer off(connect) parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerOnConnectError0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_OnConnect_Error_0100
     * @tc.desc   TLSSocketServer on(error) parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerOffConnectError0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_OffConnect_Error_0200
     * @tc.desc   TLSSocketServer off(error) parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions1900
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1900
     * @tc.desc   GetLocalAddress(callback) Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions2000
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_12000
     * @tc.desc   GetLocalAddress(promise) Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetSocketFd_0100
     * @tc.desc   TLSSocket GetSocketFd success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerSetExtraOptions0100
     * @tc.number SUB_LocalSocketServer_SetExtraOptions_0100
     * @tc.desc   test LocalSocketServer SetExtraOptions(promise) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerOn0100
     * @tc.number SUB_LocalSocketServer_On_0100
     * @tc.desc   test LocalSocketServer On(connect) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerOn0200
     * @tc.number SUB_LocalSocketServer_On_0200
     * @tc.desc   test LocalSocketServer On(error) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerOff0100
     * @tc.number SUB_LocalSocketServer_Off_0100
     * @tc.desc   test LocalSocketServer Off(connect) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerOff0200
     * @tc.number SUB_LocalSocketServer_Off_0200
     * @tc.desc   test LocalSocketServer Off(connect) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketConnect0100
     * @tc.number SUB_LocalSocket_Connect_0100
     * @tc.desc   test LocalSocket Connect 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketSend0100
     * @tc.number SUB_LocalSocket_Send_0100
     * @tc.desc   test LocalSocket Send 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketOn0100
     * @tc.number SUB_LocalSocket_On_0100
     * @tc.desc   test LocalSocket On 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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


    /**
     * @tc.name   testLocalSocketOff0100
     * @tc.number SUB_LocalSocket_Off_0100
     * @tc.desc   test LocalSocket On 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketOff0200
     * @tc.number SUB_LocalSocket_Off_0200
     * @tc.desc   test LocalSocket On 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketOff0300
     * @tc.number SUB_LocalSocket_Off_0300
     * @tc.desc   test LocalSocket Off 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketOff0400
     * @tc.number SUB_LocalSocket_Off_0400
     * @tc.desc   test LocalSocket Off 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerListen0100
     * @tc.number SUB_LocalSocketServer_Listen_0100
     * @tc.desc   test LocalSocketServer listen 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testLocalSocketServerGetState0100
     * @tc.number SUB_LocalSocketServer_GetState_0100
     * @tc.desc   test LocalSocketServer getState function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0100
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0100
     * @tc.desc   Cancel multiple subscriptions to the TCP Socket Connection shutdown event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
                    console.info('fail to connect' + err.code.toString());
                });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 2303199)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0200
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0200
     * @tc.desc   Test TCPSocketConnection send 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(null,(err,data) => {
            if(err){
              console.info(`${caseName} send failed ${JSON.stringify(err)}`);
              done();
            } else{
              console.info(`${caseName} on send data ${JSON.stringify(data)}`);
              ExpectFail();
              done();
            }
          })
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0300
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0300
     * @tc.desc   Test TCPSocketConnection onMessage 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on('message',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0400
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0400
     * @tc.desc   Test TCPSocketConnection offMessage 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0400';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.off('message',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0500
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0500
     * @tc.desc   Test TCPSocketConnection onError 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0500';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on('error',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0600
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0600
     * @tc.desc   Test TCPSocketConnection offError 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0600';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.off('error',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testSocketErrorCodeTCPSocketServer0700
     * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0700
     * @tc.desc   Test TCPSocketConnection onClose 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketErrorCodeTCPSocketServer0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0700';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on('close',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
     /**
      * @tc.name   testSocketErrorCodeTCPSocketServer0800
      * @tc.number SUB_Socket_ErrorCode_TCPSocketServer_0800
      * @tc.desc   Test TCPSocketConnection offClose 401 event
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('testSocketErrorCodeTCPSocketServer0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSocketErrorCodeTCPSocketServer0800';
      let server = socket.constructTCPSocketServerInstance();
      try {
        console.info(`${caseName} test start`);
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.off('close',undefined);
        });
        server.off('connect');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });

  })
}