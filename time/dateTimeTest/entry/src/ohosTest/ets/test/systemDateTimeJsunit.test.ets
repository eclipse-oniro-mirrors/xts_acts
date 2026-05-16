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
import systemDateTime from "@ohos.systemDateTime";
import { BusinessError } from '@ohos.base';

export default function systemDateTimeJsunit() {
  describe('systemDateTimeTest', () => {
    console.info('====>---------------systemDateTimeTest start-----------------------');

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0001
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0001", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0001 start----------------");
      systemDateTime.getCurrentTime(true, (error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>systemDateTime.getCurrentTime success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0001 catch error: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0001 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0002
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0002 start----------------");
      await systemDateTime.getCurrentTime(false).then((data) => {
        console.info('====>SUB_systemDateTime_getCurrentTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0002 fail: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0003
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0003 start----------------");
      await systemDateTime.getCurrentTime().then((data) => {
        console.info('====>SUB_systemDateTime_getCurrentTime_JS_API_0003 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0003 fail: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0003 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0004
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0004 start----------------");
      systemDateTime.getCurrentTime((error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0004 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>systemDateTime.getCurrentTime success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0004 catch error: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0004 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0005
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0005
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0005", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0005 start----------------");
      systemDateTime.getCurrentTime(false, (error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0005 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>systemDateTime.getCurrentTime success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0005 catch error: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getCurrentTime_JS_API_0005 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getCurrentTime_JS_API_0006
     * @tc.number SUB_systemDateTime_getCurrentTime_JS_API_0006
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getCurrentTime_JS_API_0006", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0006 start----------------");
      await systemDateTime.getCurrentTime(true).then((data) => {
        console.info('====>SUB_systemDateTime_getCurrentTime_JS_API_0006 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getCurrentTime_JS_API_0006 fail: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getCurrentTime_JS_API_0006 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0001
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0001", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0001 start----------------");
      systemDateTime.getRealActiveTime(true, (error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealActiveTime_JS_API_0001 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0001 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0001 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0002
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0002 start----------------");
      await systemDateTime.getRealActiveTime(false).then((data) => {
        console.log('SUB_systemDateTime_getRealActiveTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0002 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0003
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0003 start----------------");
      await systemDateTime.getRealActiveTime().then((data) => {
        console.log('SUB_systemDateTime_getRealActiveTime_JS_API_0003 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0003 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0003 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0004
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0004 start----------------");
      systemDateTime.getRealActiveTime((error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0004 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealActiveTime_JS_API_0004 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0004 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0004 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0005
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0005
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0005", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0005 start----------------");
      systemDateTime.getRealActiveTime(false, (error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0005 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealActiveTime_JS_API_0005 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0005 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealActiveTime_JS_API_0005 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealActiveTime_JS_API_0006
     * @tc.number SUB_systemDateTime_getRealActiveTime_JS_API_0006
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealActiveTime_JS_API_0006", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0006 start----------------");
      await systemDateTime.getRealActiveTime(true).then((data) => {
        console.log('SUB_systemDateTime_getRealActiveTime_JS_API_0006 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealActiveTime_JS_API_0006 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealActiveTime_JS_API_0006 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0001
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0001", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0001 start----------------");
      systemDateTime.getRealTime(true, (error, data) => {
        try {
          if (error) {
            console.error('SUB_systemDateTime_getRealTime_JS_API_0001 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealTime_JS_API_0001 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealTime_JS_API_0001 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0001 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0002
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0002 start----------------");
      await systemDateTime.getRealTime(false).then((data) => {
        console.info('====>SUB_systemDateTime_getRealTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealTime_JS_API_0002 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0003
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0003 start----------------");
      await systemDateTime.getRealTime().then((data) => {
        console.info('====>SUB_systemDateTime_getRealTime_JS_API_0003 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealTime_JS_API_0003 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0003 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0004
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0004 start----------------");
      systemDateTime.getRealTime((error, data) => {
        try {
          if (error) {
            console.error('SUB_systemDateTime_getRealTime_JS_API_0004 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealTime_JS_API_0004 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealTime_JS_API_0004 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0004 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0005
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0005
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0005", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0005 start----------------");
      systemDateTime.getRealTime(false, (error, data) => {
        try {
          if (error) {
            console.error('SUB_systemDateTime_getRealTime_JS_API_0005 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemDateTime_getRealTime_JS_API_0005 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemDateTime_getRealTime_JS_API_0005 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemDateTime_getRealTime_JS_API_0005 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemDateTime_getRealTime_JS_API_0006
     * @tc.number SUB_systemDateTime_getRealTime_JS_API_0006
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getRealTime_JS_API_0006", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0006 start----------------");
      await systemDateTime.getRealTime(true).then((data) => {
        console.info('====>SUB_systemDateTime_getRealTime_JS_API_0006 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemDateTime_getRealTime_JS_API_0006 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemDateTime_getRealTime_JS_API_0006 end------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getDate_JS_API_0100
     * @tc.number SUB_systemDateTime_getDate_JS_API_0100
     * @tc.desc   Test systemTimeDate_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getDate_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemDateTime_getDate_JS_API_0100 start");
      await systemDateTime.getDate().then((data) => {
        console.info("====>SUB_systemDateTime_getDate_JS_API_0100 getDate: " + data);
        expect(data != null).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemDateTime_getDate_JS_API_0100 getDate fail: " + error);
        expect().assertFail();
        done();
      })
      console.info("====>SUB_systemDateTime_getDate_JS_API_0100 end");

    });

    /**
     * @tc.name   SUB_systemDateTime_getDate_JS_API_0200
     * @tc.number SUB_systemDateTime_getDate_JS_API_0200
     * @tc.desc   Test systemTimeDate_setDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getDate_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemDateTime_getDate_JS_API_0200 start");
      systemDateTime.getDate((err, data) => {
        try{
          if(err){
            console.info("====>SUB_systemDateTime_getDate_JS_API_0200 getTimezone fail: " + err);
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemDateTime_getDate_JS_API_0200 getTimezone success: " + data);
          expect(data != null).assertTrue();
          done();
        }catch(error){
          console.info("====>SUB_systemDateTime_getDate_JS_API_0200 catch error " + error);
          done();
        }
      })
      console.info("====>SUB_systemDateTime_getDate_JS_API_0200 end");
    });


    /**
     * @tc.name   SUB_systemDateTime_getTimezone_JS_API_0100
     * @tc.number SUB_systemDateTime_getTimezone_JS_API_0100
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezone_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemDateTime_getTimezone_JS_API_0100 start");
      await systemDateTime.getTimezone().then( data => {
        console.info("====>SUB_systemDateTime_getTimezone_JS_API_0100 getTimezone success: " + data);
        expect(data != null).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemDateTime_getTimezone_JS_API_0100 getTimezone fail: " + error);
        expect().assertFail();
        done();
      });
      console.info("====>SUB_systemDateTime_getTimezone_JS_API_0100 end");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTimezone_JS_API_0200
     * @tc.number SUB_systemDateTime_getTimezone_JS_API_0200
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezone_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemDateTime_getTimezone_JS_API_0200 start");
      systemDateTime.getTimezone((err, data) => {
        try{
          if(err){
            console.info("====>SUB_systemDateTime_getTimezone_JS_API_0200 getTimezone fail: " + err);
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemDateTime_getTimezone_JS_API_0200 getTimezone success: " + data);
          expect(data != null).assertTrue();
          done();
        }catch(error){
          console.info("====>SUB_systemDateTime_getTimezone_JS_API_0200 catch error " + error);
          done();
        }
      })
      console.info("====>SUB_systemDateTime_getTimezone_JS_API_0200 end");
    });

  });
};
