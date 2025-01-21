// @ts-nocheck
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";

export default function systemTimeJsunit() {
  describe('systemTimeTest', function () {
    console.info('====>---------------systemTimeTest start-----------------------');
    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */

    var dates;
    var zone;
    beforeEach(async function (done) {
      let currentTime = new Date().getTime()
      dates = currentTime
      console.info("====>beforeEach data " + dates);

      systemTime.getTimezone().then( data => {
        console.info("====>beforeEach data " + data);
        zone = data
        done()
      }).catch(error => {
        console.info("====>beforeEach error " + error);
      });
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(async function (done) {
      systemTime.setTimezone(zone).then( data => {
        console.info("====>afterEach zone " + zone);
        done()
      }).catch(error => {
        console.info("====>afterEach error " + error);
      });
    });

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0001", 0, async function (done) {
      console.info("====>----------UB_systemTime_getCurrentTime_JS_API_0001 start----------------");
      systemTime.getCurrentTime(true, (error, data) => {
        try {
          if (error) {
            console.error('====>UB_systemTime_getCurrentTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SystemTime.getCurrentTime success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>UB_systemTime_getCurrentTime_JS_API_0001 catch error: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0100 end-----------------");
      });
    });

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0002", 0, async function (done) {
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 start----------------");
      await systemTime.getCurrentTime(false).then((data) => {
        console.info('====>SUB_systemTime_getCurrentTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch(err => {
        console.error('====>SUB_systemTime_getCurrentTime_JS_API_0002 fail: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 end------------");
    });

    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0001", 0, async function (done) {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0001 start----------------");
      systemTime.getRealActiveTime(true, (error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail()
            done();
          };
          console.info('====>SUB_systemTime_getRealActiveTime_JS_API_0001 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0001 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0001 end-----------------");
      });
    });

    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0002", 0, async function (done) {
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 start----------------");
      await systemTime.getRealActiveTime(false).then((data) => {
        console.log('SUB_systemTime_getRealActiveTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch(err => {
        console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0002 err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 end------------");
    });

    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealTime_JS_API_0001", 0, async function (done) {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0001 start----------------");
      systemTime.getRealTime(true, (error, data) => {
        try {
          if (error) {
            console.error('SUB_systemTime_getRealTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemTime_getRealTime_JS_API_0001 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemTime_getRealTime_JS_API_0001 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getRealTime_JS_API_0001 end-----------------");
      });
    });

    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealTime_JS_API_0002", 0, async function (done) {
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 start----------------");
      await systemTime.getRealTime(false).then((data) => {
        console.info('====>SUB_systemTime_getRealTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch(error => {
        console.error('====>SUB_systemTime_getRealTime_JS_API_0002 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 end------------");
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0100
     * @tc.name      Test systemTime.setTime
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0100', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0100 start");
      let currentTime = new Date().getTime() + 2000
      systemTime.setTime(currentTime, (err, data) => {
        try{
          if(err){
            console.info("====>SUB_systemTime_setTime_JS_API_0100 setTime fail: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info('====>SUB_systemTime_setTime_JS_API_0100 success: ' + data);
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
     * @tc.number    SUB_systemTime_setTime_JS_API_0200
     * @tc.name      Test systemTime.setTime Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0200 start");
      try{
        systemTime.setTime(15222).then(() => {
          console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime fail')
          expect().assertFail();
          done();
        }).catch((err)=>{
          console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(err))
          expect(true).assertTrue();
          console.debug('====>SUB_systemTime_setTime_JS_API_0200 end');
          done();
        })
      }catch(err){
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime throw_err' + JSON.stringify(err))
        expect(err.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0300
     * @tc.name      Test systemTime.setTime3
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0300', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0300 start");
      let currentTime = new Date().getTime() + 2000
      await systemTime.setTime(currentTime).then(() => {
        console.info('====>SUB_systemTime_setTime_JS_API_0300 success')
        expect(true).assertTrue();
        done();
      }).catch((err)=>{
        console.debug('====>SUB_systemTime_setTime_JS_API_0300 setTime fail:' + JSON.stringify(err))
        expect().assertFail();
        done();
      })
      console.info("====>SUB_systemTime_setTime_JS_API_0300 end");
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0400
     * @tc.name      Test systemTime.setTime4  Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0400', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0400 start");
      try{
        systemTime.setTime(18, (err, data) => {
          console.info("====>SUB_systemTime_setTime_JS_API_0400 data: " + data);
          console.info("====>SUB_systemTime_setTime_JS_API_0400 error: " + err);
          console.info('====>SUB_systemTime_setTime_JS_API_0400 end');
          expect(true).assertTrue();
          done();
        })
      }catch(err) {
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0200
     * @tc.name      Test systemTime.setDate Invalid value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0200 start");
      systemTime.setDate(0).then(data => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 data " + data);
        expect().assertFail();
        done();
      }).catch(error => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 error " + error);
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0400
     * @tc.name      Test systemTime.setDate true value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0400', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0400 start");
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      systemTime.setDate(date, (error, data) => {
        try {
          if(error){
            console.info("====>SUB_systemTime_setDate_JS_API_0400 setDate fail: " + JSON.stringify(error));
            expect().assertFail();
            done();
          }
          systemTime.getDate().then(async (data) => {
            try {
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + data);
              console.info("====>SUB_systemTime_setDate_JS_API_0400 setTime: " + dates);
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + JSON.stringify(data).slice(1,17));
              expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
              await systemTime.setTime(dates + 1000)
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
     * @tc.number    SUB_systemTime_setDate_JS_API_0500
     * @tc.name      Test systemTime.setDate true value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0500', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0500 start");
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      await systemTime.setDate(date).then( () => {
        console.info("====>SUB_systemTime_setDate_JS_API_0500 successful ");
        systemTime.getDate().then(async data => {
          try {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + data);
            console.info("====>SUB_systemTime_setDate_JS_API_0500 setTime: " + dates);
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + JSON.stringify(data).slice(1,17));
            expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
            await systemTime.setTime(dates + 1000)
            done();
          } catch (err) {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 catch err: " + err);
            done();
          }
        })
      }).catch(error => {
        console.info("====>SUB_systemTime_setDate_JS_API_0500 setDate fail: " + JSON.stringify(error));
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0100', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0100 start");
      systemTime.setTimezone('Asia, Shanghai').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 data " + data);
        expect().assertFail();
        done();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 error " + error);
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0200 start");
      systemTime.setTimezone('Beijing,China').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 data " + data);
        expect().assertFail();
        done();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 error " + error);
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0300', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0300 start");
      systemTime.setTimezone('Baker Island, U.S.A.').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 data " + data);
        expect().assertFail();
        done();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 error " + error);
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0400
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0400', 0, function (done) {
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
          }).catch(error => {
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
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0500
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0500', 0, async function (done) {
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
          }).catch(error => {
            console.info("====>SUB_systemTime_setTimezone_JS_API_0500 error " + error);
            expect().assertFail();
            done();
          });
        }).catch(error => {
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
  });
};
