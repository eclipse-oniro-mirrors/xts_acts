import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import { GlobalContext } from '../testability/GlobalContext.ets';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

const TLCP_TARGET_URL: string = 'https://test.gmssl.cn'; 
const TLS_TARGET_URL: string = 'https://www.baidu.com';

interface CertConfig {
  caPath: string;
  sigCertPath: string;
  sigKeyPath: string;
  encCertPath: string;
  encKeyPath: string;
}

interface CertFileInfo {
  rawPath: string;
  targetName: string;
  key: keyof CertConfig;
}

function initCertConfig(context: Context): CertConfig {
  let certConfig: CertConfig = {
    caPath: '',
    sigCertPath: '',
    sigKeyPath: '',
    encCertPath: '',
    encKeyPath: ''
  };
  try {
    const certFiles: CertFileInfo[] = [
      { rawPath: 'sm2.trust.pem', targetName: 'sm2.trust.pem', key: 'caPath' },
      { rawPath: 'sm2.user1.sig.crt.pem', targetName: 'sm2.user1.sig.crt.pem', key: 'sigCertPath' },
      { rawPath: 'sm2.user1.sig.key.pem', targetName: 'sm2.user1.sig.key.pem', key: 'sigKeyPath' },
      { rawPath: 'sm2.user1.enc.crt.pem', targetName: 'sm2.user1.enc.crt.pem', key: 'encCertPath' },
      { rawPath: 'sm2.user1.enc.key.pem', targetName: 'sm2.user1.enc.key.pem', key: 'encKeyPath' }
    ];
    
    for (const file of certFiles) {
      const sandboxPath: string = copyToSandBox(file.rawPath, file.targetName, context);
      switch (file.key) {
        case 'caPath':
          certConfig.caPath = sandboxPath;
          break;
        case 'sigCertPath':
          certConfig.sigCertPath = sandboxPath;
          break;
        case 'sigKeyPath':
          certConfig.sigKeyPath = sandboxPath;
          break;
        case 'encCertPath':
          certConfig.encCertPath = sandboxPath;
          break;
        case 'encKeyPath':
          certConfig.encKeyPath = sandboxPath;
          break;
      }
      console.info(`Certificate [${file.targetName}] Copied to: ${sandboxPath}`);
    }

    if (!validateCertConfig(certConfig)) {
      throw new Error("There is an empty certificate path, and the configuration is incomplete.");
    }

    certConfig = certConfig;
    return certConfig;
  } catch (error) {
    const err = error as BusinessError;
    const msg = `Certificate initialization failed.: ${err.message}`;
    console.error(msg);
    return certConfig;
  }
}

/**
 * Verify if the certificate configuration is complete
 */
function validateCertConfig(config: CertConfig): boolean {
  return !!(config.caPath && config.sigCertPath && config.sigKeyPath && config.encCertPath && config.encKeyPath);
}

/**
 * write files
 * @param path: file path
 * @param name: filename
 * @param content: file content
 */
function writeFile(path: string, name: string, content: string | ArrayBuffer) {
  if (!fs.accessSync(path)) {
    fs.mkdirSync(path);
  }
  let file: fs.File = fs.openSync(`${path}/${name}`, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
  fs.writeSync(file.fd, content);
  fs.fsyncSync(file.fd);
  fs.closeSync(file);
}

function copyToSandBox(rawfilePath: string, sandboxFilePath: string, context: Context) {
  try {

    let cacheDir: string = context.cacheDir;
    console.info(`cacheDir: ${cacheDir}`);
    let file: Uint8Array = context.resourceManager.getRawFileContentSync(rawfilePath);
    if (file != null) {
      writeFile(cacheDir, sandboxFilePath, file.buffer);
    }
    return `${cacheDir}/${sandboxFilePath}`;
  }
  catch (err) {
    console.error(`delete file failed with error message message: ${err.message}, code: ${err.code}`);
    return ""
  }
}

export default function HttpRequestGmssl() {
   
    describe('HttpRequestGmssl', () => {
    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0100
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0100
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0100";
        console.info(`${caseName} test Start`);

        let clientCert: http.ClientCert = {
          certPath: '',
          keyPath: '',
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        let clientEncCert: http.ClientCert = {
          certPath: '',
          keyPath: '',
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        let sslType: http.SslType = 'TLS';
        let options: http.HttpRequestOptions = {
          sslType,
          caPath: '',
          clientCert,
          clientEncCert,
        };
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(TLS_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });  

    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0200
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0200
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0200";
        console.info(`${caseName} test Start`);

        let context: Context = GlobalContext.getContext().getObject('context') as Context;
        console.info(`context================: ${JSON.stringify(context)}`);

        let certConfig = initCertConfig(context);
        console.info(`certConfig: ${JSON.stringify(certConfig)}`);

        let clientCert: http.ClientCert = {
          certPath: certConfig.sigCertPath,
          keyPath: certConfig.sigKeyPath,
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        let clientEncCert: http.ClientCert = {
          certPath: certConfig.encCertPath,
          keyPath: certConfig.encKeyPath,
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        let sslType: http.SslType = 'TLCP';
        let options: http.HttpRequestOptions = {
          sslType,
          caPath: certConfig.caPath,
          clientCert,
          clientEncCert,
        };
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });   

    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0300
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0300
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0300";
      console.info(`${caseName} test Start`);
      let context: Context = GlobalContext.getContext().getObject('context') as Context;
      console.info(`context================: ${JSON.stringify(context)}`);

      let certConfig = initCertConfig(context);
      console.info(`certConfig: ${JSON.stringify(certConfig)}`);

      let clientCert: http.ClientCert = {
        certPath: certConfig.sigCertPath,
        keyPath: certConfig.sigKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let clientEncCert: http.ClientCert = {
        certPath: certConfig.encCertPath,
        keyPath: certConfig.encKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let sslType: http.SslType = 'TLCP';
      let options: http.HttpRequestOptions = {
        sslType,
        caPath: '',
        clientCert,
        clientEncCert,
      };
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
            httpRequest.destroy();
            ExpectTrue(err.code == 2300999);
            done();
          } else {
            console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
            ExpectTrue(res.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0400
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0400
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0400";
      console.info(`${caseName} test Start`);
      let context: Context = GlobalContext.getContext().getObject('context') as Context;
      console.info(`context================: ${JSON.stringify(context)}`);

      let certConfig = initCertConfig(context);
      console.info(`certConfig: ${JSON.stringify(certConfig)}`);

      let clientCert: http.ClientCert = {
        certPath: '',
        keyPath: '',
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let clientEncCert: http.ClientCert = {
        certPath: certConfig.encCertPath,
        keyPath: certConfig.encKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let sslType: http.SslType = 'TLCP';
      let options: http.HttpRequestOptions = {
        sslType,
        caPath: certConfig.caPath,
        clientCert,
        clientEncCert,
      };
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
            httpRequest.destroy();
            ExpectTrue(err.code == 2300999);
            done();
          } else {
            console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
            console.info(`${caseName} res.responseCode:${res.responseCode}`);
            ExpectTrue(res.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0500
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0500
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0500";
      console.info(`${caseName} test Start`);
      let context: Context = GlobalContext.getContext().getObject('context') as Context;
      console.info(`context================: ${JSON.stringify(context)}`);

      let certConfig = initCertConfig(context);
      console.info(`certConfig: ${JSON.stringify(certConfig)}`);

      let clientCert: http.ClientCert = {
        certPath: certConfig.sigCertPath,
        keyPath: certConfig.sigKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let clientEncCert: http.ClientCert = {
        certPath: '',
        keyPath: '',
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let sslType: http.SslType = 'TLCP';
      let options: http.HttpRequestOptions = {
        sslType,
        caPath: certConfig.caPath,
        clientCert,
        clientEncCert,
      };
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
            httpRequest.destroy();
            ExpectTrue(err.code == 2300999);
            done();
          } else {
            console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
            console.info(`${caseName} res.responseCode:${res.responseCode}`);
            ExpectTrue(res.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions0600
     * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0600
     * @tc.desc   test performanceTiming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0600";
      console.info(`${caseName} test Start`);
      let context: Context = GlobalContext.getContext().getObject('context') as Context;
      console.info(`context================: ${JSON.stringify(context)}`);

      let certConfig = initCertConfig(context);
      console.info(`certConfig: ${JSON.stringify(certConfig)}`);

      let clientCert: http.ClientCert = {
        certPath: certConfig.sigCertPath,
        keyPath: certConfig.sigKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let clientEncCert: http.ClientCert = {
        certPath: certConfig.encCertPath,
        keyPath: certConfig.encKeyPath,
        certType: http.CertType.PEM,
        keyPassword: ''
      };
      let sslType: http.SslType = 'TLS';
      let options: http.HttpRequestOptions = {
        sslType,
        caPath: certConfig.caPath,
        clientCert,
        clientEncCert,
      };
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
            httpRequest.destroy();
            ExpectTrue(err.code == 2300058);
            done();
          } else {
            console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
            ExpectTrue(res.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  })
}