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

import { describe, it, expect, Level } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";
import { BusinessError } from '@ohos.base';

export default function systemTimeJsunit() {
  describe('systemTimeTest', () => {
    console.info('====>---------------systemTimeTest start-----------------------');

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0001
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0001", Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0002
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 start----------------");
      await systemTime.getCurrentTime(true).then((data) => {
        console.info('====>SUB_systemTime_getCurrentTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getCurrentTime_JS_API_0002 fail: ' + JSON.stringify(error));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0003
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------UB_systemTime_getCurrentTime_JS_API_0001 start----------------");
      systemTime.getCurrentTime((error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemTime_getCurrentTime_JS_API_0003 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SystemTime.getCurrentTime success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemTime_getCurrentTime_JS_API_0003 catch error: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0003 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0004
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0004 start----------------");
      await systemTime.getCurrentTime().then((data) => {
        console.info('====>SUB_systemTime_getCurrentTime_JS_API_0004 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getCurrentTime_JS_API_0004 fail: ' + JSON.stringify(error));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0004 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0001
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0001", Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0002
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 start----------------");
      await systemTime.getRealActiveTime(true).then((data) => {
        console.log('SUB_systemTime_getRealActiveTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0002 err: ' + JSON.stringify(error));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0003
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0003 start----------------");
      systemTime.getRealActiveTime((error, data) => {
        try {
          if (error) {
            console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0003 fail: ' + JSON.stringify(error));
            expect().assertFail()
            done();
          };
          console.info('====>SUB_systemTime_getRealActiveTime_JS_API_0003 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0003 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0003 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0004
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0004 start----------------");
      await systemTime.getRealActiveTime().then((data) => {
        console.log('SUB_systemTime_getRealActiveTime_JS_API_0004 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getRealActiveTime_JS_API_0004 err: ' + JSON.stringify(error));
        expect().assertFail()
        done();
      });
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0004 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0001
     * @tc.number SUB_systemTime_getRealTime_JS_API_0001
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealTime_JS_API_0001", Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0002
     * @tc.number SUB_systemTime_getRealTime_JS_API_0002
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealTime_JS_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 start----------------");
      await systemTime.getRealTime(true).then((data) => {
        console.info('====>SUB_systemTime_getRealTime_JS_API_0002 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getRealTime_JS_API_0002 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0003
     * @tc.number SUB_systemTime_getRealTime_JS_API_0003
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealTime_JS_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0003 start----------------");
      systemTime.getRealTime((error, data) => {
        try {
          if (error) {
            console.error('SUB_systemTime_getRealTime_JS_API_0003 fail: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          };
          console.info('====>SUB_systemTime_getRealTime_JS_API_0003 success data : ' + JSON.stringify(data));
          expect(data != null).assertEqual(true);
          done();
        } catch (error) {
          console.error('====>SUB_systemTime_getRealTime_JS_API_0003 catch err: ' + JSON.stringify(error));
          done();
        }
        console.info("====>----------SUB_systemTime_getRealTime_JS_API_0003 end-----------------");
      });
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0004
     * @tc.number SUB_systemTime_getRealTime_JS_API_0004
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_getRealTime_JS_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0004 start----------------");
      await systemTime.getRealTime().then((data) => {
        console.info('====>SUB_systemTime_getRealTime_JS_API_0004 success data : ' + JSON.stringify(data));
        expect(data != null).assertEqual(true);
        done();
      }).catch((error: BusinessError) => {
        console.error('====>SUB_systemTime_getRealTime_JS_API_0004 err: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      });
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0004 end------------");
    });

    /**
     * @tc.name   SUB_systemTime_getDate_JS_API_0100
     * @tc.number SUB_systemTime_getDate_JS_API_0100
     * @tc.desc   Test systemTime_getDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_getDate_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_getDate_JS_API_0100 start");
      systemTime.getDate((error, data) => {
        try {
          if(error){
            console.info("====>SUB_systemTime_getDate_JS_API_0100 getDate fail: " + JSON.stringify(error));
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemTime_getDate_JS_API_0100 getDate: " + JSON.stringify(data));
          console.info("====>SUB_systemTime_getDate_JS_API_0100 getDate: " + typeof(data));
          expect(typeof(data) === "object").assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_systemTime_getDate_JS_API_0100 catch error " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_systemTime_getDate_JS_API_0200
     * @tc.number SUB_systemTime_getDate_JS_API_0200
     * @tc.desc   Test systemTime_getDate API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_getDate_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_getDate_JS_API_0200 start");
      try {
        let data = await systemTime.getDate();
        console.info("====>SUB_systemTime_getDate_JS_API_0200 getDate: " + JSON.stringify(data));
        console.info("====>SUB_systemTime_getDate_JS_API_0200 getDate: " + typeof(data));
        expect(typeof(data) === "object").assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_systemTime_getDate_JS_API_0200 catch error " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_systemTime_getTimezone_JS_API_0100
     * @tc.number SUB_systemTime_getTimezone_JS_API_0100
     * @tc.desc   Test systemTime_getTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_getTimezone_JS_API_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_getTimezone_JS_API_0100 start");
      systemTime.getTimezone((error, data) => {
        try {
          if(error){
            console.info("====>SUB_systemTime_getTimezone_JS_API_0100 getTimezone fail: " + JSON.stringify(error));
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemTime_getTimezone_JS_API_0100 getTimezone: " + JSON.stringify(data));
          console.info("====>SUB_systemTime_getTimezone_JS_API_0100 getTimezone: " + typeof(data));
          expect(typeof(data) === "string").assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_systemTime_getTimezone_JS_API_0100 catch error " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_systemTime_getTimezone_JS_API_0200
     * @tc.number SUB_systemTime_getTimezone_JS_API_0200
     * @tc.desc   Test systemTime_getTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_getTimezone_JS_API_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_systemTime_getTimezone_JS_API_0200 start");
      try {
        let data = await systemTime.getTimezone();
        console.info("====>SUB_systemTime_getTimezone_JS_API_0200 getTimezone: " + JSON.stringify(data));
        console.info("====>SUB_systemTime_getTimezone_JS_API_0200 getTimezone: " + typeof(data));
        expect(typeof(data) === "string").assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_systemTime_getTimezone_JS_API_0200 catch error " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
};
