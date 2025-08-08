import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import socket from "@ohos.net.socket";
import { BusinessError } from '@ohos.base';

let client_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDszCCApugAwIBAgIUIuYbMYsyGoVMZvmmyMjJajq8BC4wDQYJKoZIhvcNAQEL\n" +
    "BQAwaTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\n" +
    "A1UECgwDQ09NMQowCAYDVQQLDAFXMQowCAYDVQQDDAFXMRowGAYJKoZIhvcNAQkB\n" +
    "FgszMjFAMzIxLmNvbTAeFw0yNTAyMDcwOTQ0MTFaFw0zNTAyMDUwOTQ0MTFaMGkx\n" +
    "CzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\n" +
    "A0NPTTEKMAgGA1UECwwBVzEKMAgGA1UEAwwBVzEaMBgGCSqGSIb3DQEJARYLMzIx\n" +
    "QDMyMS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD0ndDfq1m4\n" +
    "aRXk9kpKzBVtEdtovVj1jGF38i2lbaz7PzRp7c1BKoYceduchFlM7ISu9EsLOj2F\n" +
    "lUNHa2/B5fMiTU6Nnvy5REUpxONW3FtLNM2u5G7XrU5Dd39JGVpUKcj+5l2DU8nR\n" +
    "R9tbOhCkAmEYcsW0mUt/fSkVjQ//ooslvaDsZp4DvSt3E26S0k8yqjQL1BSzjiiW\n" +
    "stAq0S+fqMhWYbwU4Ze8I5/HZUN1mgSgr72vxEXnWBfu8M7rAWrCWrlaDIlbO76r\n" +
    "zyKBLsluFrluHkQYRq1yv4ICpA06atGX9KXV2cp0DzRCGVtl5GaGEUzzudZQ0hB+\n" +
    "rRyGGT+bw25LAgMBAAGjUzBRMB0GA1UdDgQWBBTi9Hh5GsXLZfAwmDeHwO5Lpd3K\n" +
    "WjAfBgNVHSMEGDAWgBTi9Hh5GsXLZfAwmDeHwO5Lpd3KWjAPBgNVHRMBAf8EBTAD\n" +
    "AQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCx8lzV3JNGXpLt/byOpy6zxNBKyH8aQyn4\n" +
    "kHIQaOGe1rwBr/OxqLJ1EK5jVnsT8kkD+IcuUmo7xgy2HGeJsw2525qSk/OCRQXX\n" +
    "tZyLyphOnPczouNVDYEZkva1rpXZi248Z4TO7pYN7ibS6RKysXYCKmBag1W7INPh\n" +
    "uJrll1iLdIfGu9aUnq/Q9CLmwvLLWeNFTtCiil0RsiNRd9kEDJStca5lb566zfbc\n" +
    "kW22FwRilLKpl7Aa5J2kfp+3p2bJxe9B+JBB/6X4WtpetReuccbNh+cAwihBD4nU\n" +
    "+lbc8BaYcD7VbqlnvvYaPqLn6JFH1lPgGgErx8rmkMS3N67qegmS\n" +
    "-----END CERTIFICATE-----"

let client_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD0ndDfq1m4aRXk\n" +
    "9kpKzBVtEdtovVj1jGF38i2lbaz7PzRp7c1BKoYceduchFlM7ISu9EsLOj2FlUNH\n" +
    "a2/B5fMiTU6Nnvy5REUpxONW3FtLNM2u5G7XrU5Dd39JGVpUKcj+5l2DU8nRR9tb\n" +
    "OhCkAmEYcsW0mUt/fSkVjQ//ooslvaDsZp4DvSt3E26S0k8yqjQL1BSzjiiWstAq\n" +
    "0S+fqMhWYbwU4Ze8I5/HZUN1mgSgr72vxEXnWBfu8M7rAWrCWrlaDIlbO76rzyKB\n" +
    "LsluFrluHkQYRq1yv4ICpA06atGX9KXV2cp0DzRCGVtl5GaGEUzzudZQ0hB+rRyG\n" +
    "GT+bw25LAgMBAAECggEACm6smM1q/yVkLKagVn5Lr6IiVF427An3ojDu5249AV4Z\n" +
    "sybUKSJSI+bCifNPB6vSoM+EX881DnxmKSaY1pEjBGR9pCaSqqgRtw1RkMPHFPcE\n" +
    "ip/tZj9a5h+ziv+MzagWjWBvvokVQ1qoLUTVrtj3IR7L9b7P7Hj/Bo9Ejmd1Pb+6\n" +
    "Qo0iHtgB5iZ9FjkEojsuFOCUxuETHsHHWTI5ss36rPJtTMIeRDQ1LVvhDz+d+hDM\n" +
    "3ZwpjIGyaXw5El5LWdxddYGFXEeLebhO/kQ527FpB8M7nJaC2Ho9Cjr3uLnHoSf0\n" +
    "EA+begUPhQotsd27AzkQ1EK80xCKkui9efqnQpniaQKBgQD/7ICWPPNzcq24myxp\n" +
    "qclZxzenruRWBu2WZ1T/tf/RMAZdF4y3B1QE5vJgYVi/vy9IpE9Rwg8UMoy8BrzL\n" +
    "Yz+qXPUJzodi/CHc7101sV8DE4F8f6NLCjuJjn+8haeGRxs4zSVLPtyHGUgXAt5D\n" +
    "eBFdQFrSKav/uaR+UMJRGrAShQKBgQD0sHPA4uUg4C7TTaS4FQgGgHObgT4ExP6k\n" +
    "7b+EW6FRvb/TM/lIitF+Vva9yhhOhvAF0HgNo3oGGcG4tfsCF/bxJDQWVBv4pqEG\n" +
    "UYA7W7Js4ZhZVfKp2eYcIbVPXD0ruO+pqquQL76r3jKP8jwv+TN/eGzuMF2x7jir\n" +
    "Jggj+H+ejwKBgERbhmkatKg0jGRPxkge2rJJPPtkAodb6GARD6oRkdftLPX2kVZd\n" +
    "9botebX2qn7k8RtFEA61d9OcQO0EG69zvhCiLa1F5fGxiNX7dXke/FLVBfQcH6Cu\n" +
    "hgKS9lmDlaCPI51DZl+31a2cOh4zXOzGiFTRGLEkAlYW3vICXjTNnRQFAoGBAN35\n" +
    "WPkJnKzHUxNTo3NveNlVHAtdIqL3Br8eAxiSe3UI+wUhaCq77DJ9t9cSiBxs4z+T\n" +
    "D+XngKIaKZhkVnJexSGbIzmCUeGvX/K4aujuVZ3axfd9NeeKCetJVQ7KcZ/BZIF5\n" +
    "l6v09Dc8GohlSt6GZoZj/AXUkJsCrhvtI4NmQnfXAoGBAJz+m6yXBnH0K9coBZrN\n" +
    "uNbPh3j6SLUG+Ddw/QMrls8myZwYtYVGk7aaIhkygGCRdYz7QdtgTEqBohLTwpfn\n" +
    "SbHGepSbrzc9eexoVaAs5Dz3jDwT6DUmrDmTnLXvCfMf5nNgmcuxmQ8xuY0Vcv8m\n" +
    "GBQERdXRmdkbVhBPrdAb6x+J\n" +
    "-----END PRIVATE KEY-----"

let server_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDmzCCAoOgAwIBAgIUR8tx5XRdaM9B/fsgr8VQXlhlG5wwDQYJKoZIhvcNAQEL\n" +
    "BQAwXTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQKDAJTWjEMMAoG\n" +
    "A1UECwwDQ09NMQowCAYDVQQDDAFIMRowGAYJKoZIhvcNAQkBFgsxMjNAMTIzLmNv\n" +
    "bTAeFw0yNTAyMDcwOTQzMDhaFw0zNTAyMDUwOTQzMDhaMF0xCzAJBgNVBAYTAkNO\n" +
    "MQswCQYDVQQIDAJHRDELMAkGA1UECgwCU1oxDDAKBgNVBAsMA0NPTTEKMAgGA1UE\n" +
    "AwwBSDEaMBgGCSqGSIb3DQEJARYLMTIzQDEyMy5jb20wggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQDE7kHngZaWZaYLIkEhMSEDXC1ui2KV0FMEZ2Uzoeq0\n" +
    "ogc8ZoC3rp/G4Nlib0MW3SRVzG5DWVxQe+hq5+W5yGy2Fm8AbgKnPUhtlHUhvbxY\n" +
    "/ftlsulQCkdoM3PFD5bW0x3UDrmt6y9H9C3W4fJ820tXeFpzOrpoQiz3febLlucy\n" +
    "iDMj2TsunLzov3jg46uGVktu0pfQGIls6Yax8QwZT9EW9lKRnHVZu6ied5xZXDI0\n" +
    "li3+OkR0Yru6sJ84EnutWRiVQd9GXo9hjqXGWzmAoGBEB4vN5ESlvzIdtK813Aa1\n" +
    "IKtvxkNPQrfKVovIi/cLGn3jdXXYqJwDJjfjMt1qup4JAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBSFFkqKMPjN5ZxRjipneN1efWuBPjAfBgNVHSMEGDAWgBSFFkqKMPjN5ZxR\n" +
    "jipneN1efWuBPjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBc\n" +
    "2blhcu3vAgEHWrC05AF0K82Z71JmwLid11xXJQ7F7OnAoZs/jPLvfGh6TIUrhyOY\n" +
    "7qbelzTUkp9ip8fRI4q0Da8grQaRnmhaeBoiKg0Ku7fLiWsQa2+2BGSQVGVlNfTS\n" +
    "ZOa9R414AxICnvUHN5mix8Y2uKLmnTvrEZCdgfOdtdr5YKsXSmdDu1KBWaFyWg1z\n" +
    "ZVuJqqNlpbNsY1ns8KzqEJMNfvdVEHT5+FSyOAjx4QU9VMVCnkEpRFajxx5QN50/\n" +
    "hsPkIEN8btr61QIKKF3DPFr+bajcx71IwHze8pGRJzdgjWu/soOrsd7nZHFE1psP\n" +
    "JqeW+nhsUwBSuhUwYLED\n" +
    "-----END CERTIFICATE-----"

let server_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDE7kHngZaWZaYL\n" +
    "IkEhMSEDXC1ui2KV0FMEZ2Uzoeq0ogc8ZoC3rp/G4Nlib0MW3SRVzG5DWVxQe+hq\n" +
    "5+W5yGy2Fm8AbgKnPUhtlHUhvbxY/ftlsulQCkdoM3PFD5bW0x3UDrmt6y9H9C3W\n" +
    "4fJ820tXeFpzOrpoQiz3febLlucyiDMj2TsunLzov3jg46uGVktu0pfQGIls6Yax\n" +
    "8QwZT9EW9lKRnHVZu6ied5xZXDI0li3+OkR0Yru6sJ84EnutWRiVQd9GXo9hjqXG\n" +
    "WzmAoGBEB4vN5ESlvzIdtK813Aa1IKtvxkNPQrfKVovIi/cLGn3jdXXYqJwDJjfj\n" +
    "Mt1qup4JAgMBAAECggEBAISwfNt+J3cC2pRZ6kRxE+ttqnb3l9+V1Ln86OWXTcuT\n" +
    "+QgrkMMy+BlK225FxZCcRKVC73CVv2vDcWDHC7TYZNdz2isR9Nu2oRykkR/A9i2I\n" +
    "RGHL4QS7SE3fjTvUOzBYY5rEqTuUYfE7h79n0rlqESPIxjkp8vvYyu+fd2jqLrGO\n" +
    "gTjxk1ZkiBt3z6/vNfObCbFDnQvo648iBsZqbQ4vZ1BIHE6f4CN7ykaP2CFjD5fj\n" +
    "AcCzjEd93Z7mGed4rJ8qW6N1XlNMkyq1k20wU7TFilV8LUVOlAr+Of6Yu+yyu7gs\n" +
    "LaRFualJS+rdp4rU1LfSuBci+U+bsMQF7DDYQ7YyidkCgYEA5C2VOi08OGHnhAmu\n" +
    "X/k79bd83CaVlEjjuWXlphZd2GaDUu1yB0xzF+Ur7Tb1ZeGE7BIgmi0UgbymXNs1\n" +
    "hcpjqPTM1boBXCogxV0T6yekxb2g7GAyk8XVFRz3WxpV+Y/vYrz4y752UnML4PoM\n" +
    "tdkZrIh8CzDh5mLnhgdR4yYOz38CgYEA3PFPYHEXzeL205Os30lWaUNbWs10lUxi\n" +
    "5YQQM6btQVrxAbZkP5V8tU2aZY8GkVwbmiL7bpgtjse4a0KEPLJNNBbDkdQwLM8M\n" +
    "lZ7txDCmLciggsfp3wM4CSXfjZvresefp7/ZsDMzQd8sOostCgApJQ785HdZz0N4\n" +
    "s7KxE5mc1ncCgYEA5BgxCZP4lABCt/oZhzUVXD8NIOGtOytWAZo75DiNnWp0sqxM\n" +
    "BcHFd8iOjbYXv72d64L/dj/ENSDJSR+UtGaqE1aLgMdM3r36PnEaHUNm8ojqWgCb\n" +
    "7p6fsFhhaH++HBhnW9O9/aYqj6cT49TyacJZaOCS53j5CR4rhQ7CLAh6W68CgYBi\n" +
    "QyQ1VTbsB2QVJxl8WOaIfD91++g8ujNFtl1qS3Q7W9HSHCcrrDVBgRkIz/pwzZEt\n" +
    "FR/TyPSCCss3UOb1A6uYXgNuqPsgApmrNXqzhZtyw0a3w2d9GrZiQyjQlya8fWnB\n" +
    "Nm7/kVXblwDZrKpER1wFMkxA49/acTyOVwuwFuKM8wKBgQDawB92QDtj66iXbW07\n" +
    "SnfEVMS/DrQQHKPs1TvQdEszH5pwawzBZF7zW9863ngAwVyAl5dMDorvidntt2Wj\n" +
    "+472xnlmpbU/DfB1ZdndAjw7rE41ypooEKerLzUbvCMqhYWsMSekk0DufAbaHzjd\n" +
    "tDCfoR6d5SaZSL+shSrqCdWunA==\n" +
    "-----END PRIVATE KEY-----"


function ExpectFail(): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`---test failed`);
  }
};
function getPortNumber(): number {
  let num = 1000+ Math.floor(Math.random() * 1000)+Math.floor(Math.random() * 2000)+Math.floor(Math.random() * 2000)
  return num
};

function ExpectTrue(exp: boolean): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`---test failed`);
  }
};

export default function SocketGetSocketFdTest() {
  describe('SocketGetSocketFdTest', async () => {

    /*
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0100
     * @tc.name   : testNetmanagerConnectionGetSocketFd0100
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetmanagerConnectionGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        tls.getSocketFd().then((data: number) => {
          console.info(`${caseName} get data success :${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0200
     * @tc.name   : testNetmanagerConnectionGetSocketFd0200
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetmanagerConnectionGetSocketFd0200';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: getPortNumber(),
        };
        await tls.bind(bindAddress);
        tls.getSocketFd().then((data: number) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          ExpectTrue(data !== undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).finally(async () => {
          await tls.close();
          console.info(`${caseName} test end`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0300
     * @tc.name   : testNetmanagerConnectionGetSocketFd0300
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetmanagerConnectionGetSocketFd0300';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: getPortNumber()
        };
        await tcp.bind(bindAddress).then(async ()=>{
          console.info(`${caseName} bind success `);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp.connect(tcpConnectOptions).then(async ()=>{
            console.info(`${caseName} connect success `);
            let tls: socket.TLSSocket = socket.constructTLSSocketInstance(tcp);
            await tls.getSocketFd().then((data: number) => {
              console.info(`${caseName} getSocketFd success data:${JSON.stringify(data)}`);
              ExpectTrue(data !== undefined);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} getSocketFd fail err:${JSON.stringify(err)}`);
              ExpectFail();
            })
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.error(`${caseName} connect fail err is :${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        }).catch((err: BusinessError)=>{
          console.error(`${caseName} bind fail err is :${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });


    /**
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0400
     * @tc.name   : testNetmanagerConnectionGetSocketFd0400
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetmanagerConnectionGetSocketFd0400';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: getPortNumber(),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: getPortNumber(),
        family: 1
      }
      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_rightCA: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: server_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      try {
        tlsServer.listen(tlsConnectOptions_server).then(() => {
          console.info(`${caseName} listen success!`);
          tls.bind(bindAddr).then(() => {
            console.info(`${caseName} bind success`)
            tls.connect(tlsConnectOptions_client_rightCA).then(async () => {
              console.info(`${caseName} connect success!`);
              await tls.send('hahahaha').then(()=>{
                console.info(`${caseName} send success!`)
              })
              tls.getSocketFd().then((data: number) => {
                console.info(`${caseName} getSocketFd  success data:${JSON.stringify(data)}`);
                ExpectTrue(data !== undefined);
                console.info(`${caseName}---End`);
                done();
              }).catch((err: BusinessError) => {
                console.error(`${caseName} getSocketFd  fail err:${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              })
            }).catch((err: BusinessError) => {
              console.error(`${caseName} connect failed ` + JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} bind failed `+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(`${caseName} listen fail: ` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch err in `,JSON.stringify(err))
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0500
     * @tc.name   : testNetmanagerConnectionGetSocketFd0500
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetmanagerConnectionGetSocketFd0500';
      console.info(`${caseName}---Start`);
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: getPortNumber(),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 9000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_rightCA: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: server_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.listen(tlsConnectOptions_server).then(() => {
          console.log(`${caseName} listen success!`);
          tls.bind(bindAddr).then(async () => {
            console.log(`${caseName} bind success `)
            await tls.getSocketFd().then((data: number) => {
              console.info(`${caseName} getSocketFd success data:${JSON.stringify(data)}`);
              ExpectTrue(data !== undefined);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} getSocketFd fail err:${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
            await tls.connect(tlsConnectOptions_client_rightCA).then(async () => {
              console.log(`${caseName} connect success!`);
              tls.send("hahaha").then(()=>{
                console.log(`${caseName} send success!`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} send fail`+JSON.stringify(err));
                ExpectFail();
              })
              done();
              console.info(`${caseName}---End`);
            }).catch((err: BusinessError) => {
              console.log(`${caseName} connect failed ` + JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }).catch((err: BusinessError) => {
            console.log(`${caseName} bind failed `+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(`${caseName} listen fail: ` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch err in `,JSON.stringify(err))
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })
    /**
     * @tc.number : SUB_Netmanager_Connection_GetSocketFd_0600
     * @tc.name   : testNetmanagerConnectionGetSocketFd0600
     * @tc.desc   : Test whether getfd can be invoked normally
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetmanagerConnectionGetSocketFd0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetmanagerConnectionGetSocketFd0600';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: getPortNumber(),
        };
        let bindAddressFn = (index:number) =>{
          return {
            address: '127.0.0.1',
            port: 7777+ index
          } as socket.NetAddress
        }
        await tls.bind(bindAddress);
        const BASE_COUNT:number = 100
        let loopToGetFd= async (index:number) =>{
          await tls.bind(bindAddressFn(index)).then(()=>{
            console.info(`${caseName} bind success`)
          })
          await tls.getSocketFd().then(async (data: number) => {
            console.info(`${caseName} getSocketFd index is `+index+` success data :${JSON.stringify(data)}`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }).finally(()=>{
            console.info("`${caseName} getSocketFd index is `+index+=====finally")
            if (index < BASE_COUNT) {
              loopToGetFd(index + 1);
            }else {
              tls.close()
              ExpectTrue(true);
              done()
            }
          })
        }
        loopToGetFd(1);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

  })
}
