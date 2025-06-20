import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { connection } from '@kit.NetworkKit';
import  socket  from '@ohos.net.socket';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}


export default function ConnextionErrorCode() {
  describe('ConnextionErrorCode',  () => {

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0100
     * @tc.name   : testConnectionGetAddressesByNameErrCo0100
     * @tc.desc   : AddressesByName  Parameter error
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo0100';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName(undefined, (error: BusinessError, data: connection.NetAddress[]) => {
          if (error) {
            console.error(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            ExpectTrue(error.code == 401);
          }else {
            console.info(`${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectTrue(false);
          }
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0200
     * @tc.name   : testConnectionGetAddressesByNameErrCo0200
     * @tc.desc   : AddressesByName  Parameter error
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo0200';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName(undefined).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} success to get addressta: ` + JSON.stringify(data));
          ExpectTrue(false);
          done();
        })
          .catch((error: BusinessError)=>{
            console.error(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            ExpectTrue(error.code == 401);
            done();
          })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_SocketLocal_Bind_ErrCo_0300
     * @tc.name   : testNetworkMgrSocketLocalBindErrCo0300
     * @tc.desc   : SocketLocal  Parameter error
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrSocketLocalBindErrCo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalBindErrCo0300';
      console.info(`${caseName} test start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        await client.bind(undefined).then(() => {
          console.log('bind success')
          ExpectTrue(false)
          done();
        })
          .catch((err: BusinessError) => {
          console.error('failed to bind: ' + JSON.stringify(err))
          ExpectTrue(err.code == 401)
          done()
        });
        console.info(`${caseName} test end`);
        client.close()
      }catch (error) {
        console.info(`${caseName} catch err: ${JSON.stringify(error)}`);
        ExpectTrue(error.code == 401)
        done(error);
      }
    });



    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0400
     * @tc.name   : testConnectionGetAddressesByNameErrCo0400
     * @tc.desc   : AddressesByName  Cannot connect to service
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo0400';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName("www.dsfhkashdfasdfasdfsdf.com/sef/", (error: BusinessError, data: connection.NetAddress[]) => {
          if (error) {
            console.error(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            ExpectTrue(error.code == 2100002);
          }else {
            console.info(`${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectTrue(false);
          }
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0500
     * @tc.name   : testConnectionGetAddressesByNameErrCo0500
     * @tc.desc   : AddressesByName  Cannot connect to service
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo0500';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName('as').then((data: connection.NetAddress[])=>{
          console.info(`${caseName} success to get addressta: ` + JSON.stringify(data));
          ExpectTrue(false);
          done();
        })
          .catch((error: BusinessError)=>{
            console.error(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            ExpectTrue(error.code == 2100002);
            done();
          })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.number : SUB_Connection_GetAddressByName_ErrCo_0600
     * @tc.name   : testConnectionGetAddressByNameErrC0600
     * @tc.desc   : getAddressByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionGetAddressByNameErrC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressByNameErrC0600';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Connection_GetAddressByName_ErrC_0700
     * @tc.name   : testConnectionGetAddressByNameErrC0700
     * @tc.desc   : getAddressByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionGetAddressByNameErrC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressByNameErrC0700';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressByName(host,(error: BusinessError, data: connection.NetAddress)=>{
            if(error){
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001)
              done();
            }
          })
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetHandle_GetAddressesByName_ErrCo_0800
     * @tc.name   : testNetHandleGetAddressesByNameErrCo0800
     * @tc.desc   : getAddressesByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetHandleGetAddressesByNameErrCo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo0800';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetHandle_GetAddressesByName_ErrCo_0900
     * @tc.name   : testNetHandleGetAddressesByNameErrCo0900
     * @tc.desc   : getAddressesByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetHandleGetAddressesByNameErrCo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo0900';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RegisterErC_1000
     * @tc.name       : testNetworkMgrConnectionRegisterErC_1000
     * @tc.desc       : test the same callback exists
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRegisterErC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRegisterErC_1000";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((err: BusinessError) => {
          console.info(`${caseName} register callback01: ${JSON.stringify(err)}`);
        });
        await sleep(1000);
        netCon.register((err: BusinessError) => {
          console.info(`${caseName} register callback02: ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2101008)
          done();
        });
        await sleep(1000);
        ExpectTrue(false);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        console.info(`${caseName}---End`);
        ExpectTrue(false);
        done();
      }
    });


    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_NetCap_0100
     * @tc.name       : testNetworkMgrConnectionOnNetCap0100
     * @tc.desc       : Subscription to network capability change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOnNetCap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionOnNetCap0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
         netCon.register((error: BusinessError) => {
           console.log(`${caseName} register start`)
         });
         netCon.on('netCapabilitiesChange', (data: connection.NetCapabilityInfo) => {
          console.log("mona:",data.netHandle)
          console.log("mona:",data.netCap)
          ExpectTrue(data.netHandle != undefined)
          ExpectTrue(data.netCap != undefined)
          console.info(`${caseName} Succeeded to get data:  + ${JSON.stringify(data)}}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
}
