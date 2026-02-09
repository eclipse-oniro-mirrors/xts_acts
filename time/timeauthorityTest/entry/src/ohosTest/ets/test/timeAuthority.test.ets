/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";
import { BusinessError } from '@ohos.base';

export default function systemTimeAuthorityJsunit() {
  describe('systemTimeAuthorityTest', () => {
    console.info('====>---------------systemTimeAuthorityTest start-----------------------');

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    let zone: string;
    beforeEach(async (done: Function) => {
      systemTime.getTimezone().then( (data) => {
        console.info("====>beforeEach data " + data);
        zone = data
        done()
      }).catch((error: BusinessError) => {
        console.info("====>beforeEach error " + error);
      });
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(async (done: Function) => {
      systemTime.setTimezone(zone).then( () => {
        console.info("====>afterEach zone " + zone);
        done()
      }).catch((error: BusinessError) => {
        console.info("====>afterEach error " + JSON.stringify(error));
      });
    });

    /**
     * @tc.name   SUB_systemTime_setTime_JS_API_0100
     * @tc.number SUB_systemTime_setTime_JS_API_0100
     * @tc.desc   Test systemTime_setTime API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTime_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0100 start");
      let currentTime = new Date().getTime() + 2000;
      systemTime.setTime(currentTime, (err) => {
        try{
          if(err){
            console.info("====>SUB_systemTime_setTime_JS_API_0100 setTime fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info('====>SUB_systemTime_setTime_JS_API_0100 success');
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info("====>SUB_systemTime_setTime_JS_API_0100 catch error: " + JSON.stringify(err));
          done();
        }
      });
      console.info("====>SUB_systemTime_setTime_JS_API_0100 end");
    });

    /**
     * @tc.name   SUB_systemTime_setTime_JS_API_0200
     * @tc.number SUB_systemTime_setTime_JS_API_0200
     * @tc.desc   Test systemTime_setTime API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTime_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0200 start");
      systemTime.setTime(15222).then(() => {
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime fail')
        expect().assertFail();
      }).catch((error: BusinessError)=>{
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(error))
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(error.code))
        expect(error.code).assertEqual(-1);
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 end');
        done();
      })
    });

    /**
     * @tc.name   SUB_systemTime_setTime_JS_API_0300
     * @tc.number SUB_systemTime_setTime_JS_API_0300
     * @tc.desc   Test systemTime_setTime API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTime_JS_API_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0300 start");
      let currentTime = new Date().getTime() + 2000;
      await systemTime.setTime(currentTime).then(() => {
        console.info('====>SUB_systemTime_setTime_JS_API_0300 success')
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError)=>{
        console.debug('====>SUB_systemTime_setTime_JS_API_0300 setTime fail:' + JSON.stringify(error))
        expect().assertFail();
        done();
      })
      console.info("====>SUB_systemTime_setTime_JS_API_0300 end");
    });

    /**
     * @tc.name   SUB_systemTime_setTime_JS_API_0400
     * @tc.number SUB_systemTime_setTime_JS_API_0400
     * @tc.desc   Test systemTime_setTime API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTime_JS_API_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0400 start");
      systemTime.setTime(18, (err) => {
        try {
          expect(err.code).assertEqual(-1);
          console.info("====>SUB_systemTime_setTime_JS_API_0400 error: " + err);
          console.info('====>SUB_systemTime_setTime_JS_API_0400 end');
        } catch (err) {
          console.info('====>SUB_systemTime_setTime_JS_API_0400 err: ' + JSON.stringify(err));
        }
        done();
      })
    });

    /**
     * @tc.name   SUB_systemTime_setDate_JS_API_0200
     * @tc.number SUB_systemTime_setDate_JS_API_0200
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setDate_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0200 start");
      systemTime.setDate(new Date(0)).then( () => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 setDate fail ");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 error: " + error);
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.name   SUB_systemTime_setDate_JS_API_0400
     * @tc.number SUB_systemTime_setDate_JS_API_0400
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_systemTime_setDate_JS_API_0400', Level.LEVEL0, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0400 start");
      let currentTime = new Date().getTime();
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      systemTime.setDate(date, (error) => {
        try {
          if(error){
            console.info("====>SUB_systemTime_setDate_JS_API_0400 setDate fail: " + JSON.stringify(error));
            expect().assertFail();
            done();
          }
          systemTime.getDate().then(async (data) => {
            try {
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + data);
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + JSON.stringify(data).slice(1,17));
              await systemTime.setTime(currentTime + 20)
              expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_systemTime_setDate_JS_API_0400 catch err: " + err);
              done();
            }
          })
        } catch (err) {
          console.info("====>SUB_systemTime_setDate_JS_API_0400 catch error " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_systemTime_setDate_JS_API_0500
     * @tc.number SUB_systemTime_setDate_JS_API_0500
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_systemTime_setDate_JS_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0500 start");
      let currentTime = new Date().getTime();
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      try {
        await systemTime.setDate(date);
        console.info("====>SUB_systemTime_setDate_JS_API_0500 setDate successful");
        systemTime.getDate().then(async data => {
          try {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + data);
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + JSON.stringify(data).slice(1,17));
            await systemTime.setTime(currentTime + 20)
            expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 catch err: " + err);
            done();
          }
        })
      } catch (err) {
        console.info("====>SUB_systemTime_setDate_JS_API_0500 setDate fail: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_systemTime_setTimezone_JS_API_0100
     * @tc.number SUB_systemTime_setTimezone_JS_API_0100
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTimezone_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0100 start");
      systemTime.setTimezone('Asia, Shanghai').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 setTimezone fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.name   SUB_systemTime_setTimezone_JS_API_0200
     * @tc.number SUB_systemTime_setTimezone_JS_API_0200
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTimezone_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0200 start");
      systemTime.setTimezone('Beijing,China').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.name   SUB_systemTime_setTimezone_JS_API_0300
     * @tc.number SUB_systemTime_setTimezone_JS_API_0300
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_setTimezone_JS_API_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0300 start");
      systemTime.setTimezone('Baker Island, U.S.A.').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 data fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.name   SUB_systemTime_setTimezone_JS_API_0400
     * @tc.number SUB_systemTime_setTimezone_JS_API_0400
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_systemTime_setTimezone_JS_API_0400', Level.LEVEL0, (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0400 start");
      systemTime.setTimezone('Asia/Jakarta',async (err) => {
        try{
          if(err){
            console.info("====>SUB_systemTime_setTimezone_JS_API_0400 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemTime_setTimezone_JS_API_0400 success ");
          systemTime.getTimezone().then( data => {
            try {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0400 getTimezone " + data);
              expect(data == 'Asia/Jakarta').assertTrue();
              done();
            } catch (error) {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0400 getTimezone catch error " + error);
              done();
            }
          }).catch((error: BusinessError) => {
            console.info("====>SUB_systemTime_setTimezone_JS_API_0400 error " + error);
            done();
          });
        }catch(err){
          console.info("====>SUB_systemTime_setTimezone_JS_API_0400 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   SUB_systemTime_setTimezone_JS_API_0500
     * @tc.number SUB_systemTime_setTimezone_JS_API_0500
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_systemTime_setTimezone_JS_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0500 start");
      try{
        await systemTime.setTimezone('Europe/Moscow').then(() => {
          console.info("====>SUB_systemTime_setTimezone_JS_API_0500 promise successful " );
          systemTime.getTimezone().then( data => {
            try {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0500 getTimezone " + data);
              expect(data == 'Europe/Moscow').assertTrue();
              done();
            } catch (error) {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0500 getTimezone catch error " + error);
              done();
            }
          }).catch((error: BusinessError) => {
            console.info("====>SUB_systemTime_setTimezone_JS_API_0500 error " + error);
            expect().assertFail();
            done();
          });
        }).catch((error: BusinessError) => {
          console.info("====>SUB_systemTime_setTimezone_JS_API_0500 error " + error.code);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info("====>SUB_systemTime_setTimezone_JS_API_0500 catch error: " + err.code);
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setDate_0010
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setDate_0010
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setDate_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0010 start");
      let currentTime = new Date().getTime();
      let date = new Date(2023,1,28);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0010 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0010 getDate: " + date.toDateString());
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0010 setDate success");
          expect(date.toDateString()).assertEqual("Tue Feb 28 2023");
          done();
        } catch (err) {
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0010 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setDate_0020
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setDate_0020
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setDate_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 start");
      let currentTime = new Date().getTime();
      let date = new Date(2024,1,29);
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 date: " + date.toDateString());
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date1 = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 toDateString date1: " + date1.toDateString());
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 setDate success: " + date1);
          expect(date1.toDateString()).assertEqual("Thu Feb 29 2024");
          done();
        } catch (err) {
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setDate_0020 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010 start");
      systemTime.setTimezone('America/Mexico_City',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010 getTimezone " + date);
          expect(date == 'America/Mexico_City').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0010 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020 start");
      systemTime.setTimezone('Asia/Kuala_Lumpur',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020 getTimezone " + date);
          expect(date == 'Asia/Kuala_Lumpur').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0020 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030 start");
      systemTime.setTimezone('Pacific/Auckland',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030 getTimezone " + date);
          expect(date == 'Pacific/Auckland').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0030 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040 start");
      systemTime.setTimezone('Pacific/Tahiti',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040 getTimezone " + date);
          expect(date == 'Pacific/Tahiti').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0040 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050 start");
      systemTime.setTimezone('Pacific/Port_Moresby',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050 getTimezone " + date);
          expect(date == 'Pacific/Port_Moresby').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0050 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060 start");
      systemTime.setTimezone('Asia/Gaza',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060 getTimezone " + date);
          expect(date == 'Asia/Gaza').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0060 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070 start");
      systemTime.setTimezone('Europe/Lisbon',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070 getTimezone " + date);
          expect(date == 'Europe/Lisbon').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0070 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080 start");
      systemTime.setTimezone('Europe/Moscow',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080 getTimezone " + date);
          expect(date == 'Europe/Moscow').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0080 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090 start");
      systemTime.setTimezone('Europe/Kiev',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090 getTimezone " + date);
          expect(date == 'Europe/Kiev').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0090 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100 start");
      systemTime.setTimezone('Pacific/Wake',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100 getTimezone " + date);
          expect(date == 'Pacific/Wake').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0100 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110 start");
      systemTime.setTimezone('America/New_York',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110 getTimezone " + date);
          expect(date == 'America/New_York').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0110 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120 start");
      systemTime.setTimezone('Asia/Tashkent',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120 success ");
          let date = await systemTime.getTimezone();
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120 getTimezone " + date);
          expect(date == 'Asia/Tashkent').assertTrue();
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0120 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130 start");
      systemTime.setTimezone('Beijing/China',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130 setTimezone fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
          }else{
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130 success ");
            expect().assertFail();
          }
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0130 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140
     * @tc.number Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140', Level.LEVEL2, (done: Function) => {
      console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140 start");
      systemTime.setTimezone('Shanghai/Asia',async (err) => {
        try{
          if(err){
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140 setTimezone fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
          }else{
            console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140 success ");
            expect().assertFail();
          }
          done();
        }catch(err){
          console.info("====>Sub_Misc_TimeManage_ChangeNotice_setTimezone_0140 error " + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setDate_test1
     * @tc.number systemTime_setDate_test1
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test1', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test1 start");
      let date = new Date();
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test1 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setDate_test1 setDate success");
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test1 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test2
     * @tc.number systemTime_setDate_test2
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test2', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test2 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,0,1);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test2 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test2 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test2 setDate success");
          expect(date.toDateString()).assertEqual("Sat Jan 01 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test2 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test3
     * @tc.number systemTime_setDate_test3
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test3', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test3 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,0,15);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test3 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test3 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test3 setDate success");
          expect(date.toDateString()).assertEqual("Sat Jan 15 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test3 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test4
     * @tc.number systemTime_setDate_test4
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test4', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test4 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,0,31);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test4 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test4 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test4 setDate success");
          expect(date.toDateString()).assertEqual("Mon Jan 31 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test4 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test5
     * @tc.number systemTime_setDate_test5
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test5', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test5 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,0,32);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test5 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test5 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test5 setDate success");
          expect(date.toDateString()).assertEqual("Tue Feb 01 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test5 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test6
     * @tc.number systemTime_setDate_test6
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test6', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test6 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,0,29);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test6 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test6 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test6 setDate success");
          expect(date.toDateString()).assertEqual("Sat Jan 29 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test6 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test8
     * @tc.number systemTime_setDate_test8
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test8', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test8 start");
      let currentTime = new Date().getTime();
      let date = new Date(2024,1,30);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test8 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test8 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test8 setDate success");
          expect(date.toDateString()).assertEqual("Fri Mar 01 2024");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test8 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test9
     * @tc.number systemTime_setDate_test9
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test9', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test9 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,5,30);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test9 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test9 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test9 setDate success");
          expect(date.toDateString()).assertEqual("Thu Jun 30 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test9 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test10
     * @tc.number systemTime_setDate_test10
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test10', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test10 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,5,31);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test10 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test10 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test10 setDate success");
          expect(date.toDateString()).assertEqual("Fri Jul 01 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test10 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setDate_test11
     * @tc.number systemTime_setDate_test11
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setDate_test11', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setDate_test11 start");
      let currentTime = new Date().getTime();
      let date = new Date(2022,11,31);
      systemTime.setDate(date,async (err) => {
        try {
          if(err){
            console.info("====>systemTime_setDate_test11 setDate fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          let date = await systemTime.getDate();
          await systemTime.setTime(currentTime + 20)
          console.info("====>systemTime_setDate_test11 getDate: " + date.toDateString());
          console.info("====>systemTime_setDate_test11 setDate success");
          expect(date.toDateString()).assertEqual("Sat Dec 31 2022");
          done();
        } catch (err) {
          console.info("====>systemTime_setDate_test11 setDate err" +  JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   systemTime_setTimezone_test1
     * @tc.number systemTime_setTimezone_test1
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test1', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test1 start");
      systemTime.setTimezone('Antarctica/McMurdo',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test1 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test1 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test1 getTimezone " + date);
          expect(date == 'Antarctica/McMurdo').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test1 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test2
     * @tc.number systemTime_setTimezone_test2
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test2', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test2 start");
      systemTime.setTimezone('Europe/Madrid',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test2 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test2 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test2 getTimezone " + date);
          expect(date == 'Europe/Madrid').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test2 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test7
     * @tc.number systemTime_setTimezone_test7
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test7', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test7 start");
      systemTime.setTimezone('Asia/Ulaanbaatar',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test7 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test7 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test7 getTimezone " + date);
          expect(date == 'Asia/Ulaanbaatar').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test7 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test10
     * @tc.number systemTime_setTimezone_test10
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test10', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test10 start");
      systemTime.setTimezone('America/Argentina/Buenos_Aires',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test10 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test10 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test10 getTimezone " + date);
          expect(date == 'America/Argentina/Buenos_Aires').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test10 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test11
     * @tc.number systemTime_setTimezone_test11
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test11', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test11 start");
      systemTime.setTimezone('Australia/Sydney',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test11 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test11 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test11 getTimezone " + date);
          expect(date == 'Australia/Sydney').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test11 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test12
     * @tc.number systemTime_setTimezone_test12
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test12', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test12 start");
      systemTime.setTimezone('America/Noronha',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test12 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test12 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test12 getTimezone " + date);
          expect(date == 'America/Noronha').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test12 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test13
     * @tc.number systemTime_setTimezone_test13
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test13', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test13 start");
      systemTime.setTimezone('America/St_Johns',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test13 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test13 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test13 getTimezone " + date);
          expect(date == 'America/St_Johns').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test13 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test14
     * @tc.number systemTime_setTimezone_test14
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test14', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test14 start");
      systemTime.setTimezone('Africa/Kinshasa',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test14 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test14 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test14 getTimezone " + date);
          expect(date == 'Africa/Kinshasa').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test14 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test15
     * @tc.number systemTime_setTimezone_test15
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test15', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test15 start");
      systemTime.setTimezone('America/Santiago',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test15 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test15 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test15 getTimezone " + date);
          expect(date == 'America/Santiago').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test15 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test16
     * @tc.number systemTime_setTimezone_test16
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test16', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test16 start");
      systemTime.setTimezone('Asia/Shanghai',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test16 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test16 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test16 getTimezone " + date);
          expect(date == 'Asia/Shanghai').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test16 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test17
     * @tc.number systemTime_setTimezone_test17
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test17', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test17 start");
      systemTime.setTimezone('Asia/Nicosia',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test17 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test17 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test17 getTimezone " + date);
          expect(date == 'Asia/Nicosia').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test17 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test18
     * @tc.number systemTime_setTimezone_test18
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test18', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test18 start");
      systemTime.setTimezone('Europe/Berlin',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test18 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test18 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test18 getTimezone " + date);
          expect(date == 'Europe/Berlin').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test18 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test19
     * @tc.number systemTime_setTimezone_test19
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test19', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test19 start");
      systemTime.setTimezone('America/Guayaquil',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test19 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test19 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test19 getTimezone " + date);
          expect(date == 'America/Guayaquil').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test19 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test20
     * @tc.number systemTime_setTimezone_test20
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test20', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test20 start");
      systemTime.setTimezone('Pacific/Pohnpei',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test20 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test20 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test20 getTimezone " + date);
          expect(date == 'Pacific/Pohnpei').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test20 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test22
     * @tc.number systemTime_setTimezone_test22
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test22', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test22 start");
      systemTime.setTimezone('America/Godthab',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test22 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test22 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test22 getTimezone " + date);
          expect(date == 'America/Godthab').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test22 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test23
     * @tc.number systemTime_setTimezone_test23
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test23', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test23 start");
      systemTime.setTimezone('Asia/Jakarta',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test23 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test23 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test23 getTimezone " + date);
          expect(date == 'Asia/Jakarta').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test23 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test24
     * @tc.number systemTime_setTimezone_test24
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test24', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test24 start");
      systemTime.setTimezone('Pacific/Tarawa',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test24 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test24 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test24 getTimezone " + date);
          expect(date == 'Pacific/Tarawa').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test24 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test25
     * @tc.number systemTime_setTimezone_test25
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test25', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test25 start");
      systemTime.setTimezone('Asia/Almaty',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test25 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test25 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test25 getTimezone " + date);
          expect(date == 'Asia/Almaty').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test25 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTimezone_test26
     * @tc.number systemTime_setTimezone_test26
     * @tc.desc   Test systemTime_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTimezone_test26', Level.LEVEL2, (done: Function) => {
      console.info("====>systemTime_setTimezone_test26 start");
      systemTime.setTimezone('Pacific/Majuro',async (err) => {
        try{
          if(err){
            console.info("====>systemTime_setTimezone_test26 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info("====>systemTime_setTimezone_test26 success ");
          let date = await systemTime.getTimezone();
          console.info("====>systemTime_setTimezone_test26 getTimezone " + date);
          expect(date == 'Pacific/Majuro').assertTrue();
          done();
        }catch(err){
          console.info("====>systemTime_setTimezone_test26 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTime_test1
     * @tc.number systemTime_setTime_test1
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTime_test1', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setTime_test1 start");
      systemTime.setTime(0, (err) => {
        try {
          if(err){
            console.info("====>systemTime_setTime_test1 setTime failed: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            console.info('====>systemTime_setTime_test1 end');
          }else{
            console.info("====>systemTime_setTime_test1 success");
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info('====>systemTime_setTime_test1 err: ' + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTime_test2
     * @tc.number systemTime_setTime_test2
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTime_test2', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setTime_test2 start");
      systemTime.setTime(2, (err) => {
        try {
          if(err){
            console.info("====>systemTime_setTime_test2 setTime failed: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            console.info('====>systemTime_setTime_test2 end');
          }else{
            console.info("====>systemTime_setTime_test2 success");
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info('====>systemTime_setTime_test2 err: ' + JSON.stringify(err));
          done();
        }
      })
    });

    /**
     * @tc.name   systemTime_setTime_test3
     * @tc.number systemTime_setTime_test3
     * @tc.desc   Test systemTime_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('systemTime_setTime_test3', Level.LEVEL2, async (done: Function) => {
      console.info("====>systemTime_setTime_test3 start");
      systemTime.setTime(Number.MAX_VALUE / 2, (err) => {
        console.info("====>systemTime_setTime_test3 Number.MAX_VALUE / 2" + Number.MAX_VALUE / 2);
        try {
          if(err){
            console.info("====>systemTime_setTime_test3 setTime failed: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            console.info('====>systemTime_setTime_test3 end');
          }else{
            console.info("====>systemTime_setTime_test3 success");
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info('====>systemTime_setTime_test3 err: ' + JSON.stringify(err));
          done();
        }
      })
    });

  });
};
