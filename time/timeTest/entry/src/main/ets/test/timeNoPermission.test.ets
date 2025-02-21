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

import { describe, it, expect } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";

export default function systemTimeNoPermissionJsunit() {
  describe('systemTimeNoPermissionTest', () => {
    console.info('====>---------------systemTimeNNoPermissionTest start-----------------------');

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setTime_0010
     * @tc.name      Test systemTime.setTime
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setTime_0010', 0, async (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setTime_0010 start");
      let currentTime = new Date().getTime() + 2000
      systemTime.setTime(currentTime, (err, data) => {
        try{
          if(err){
            console.info("====>SUB_Misc_systemTime_NoPermission_setTime_0010 setTime permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            done();
          }else{
            console.info('====>SUB_Misc_systemTime_NoPermission_setTime_0010 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>SUB_Misc_systemTime_NoPermission_setTime_0010 catch err: " + JSON.stringify(err));
          done();
          console.info("====>SUB_Misc_systemTime_NoPermission_setTime_0010 end");
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setTime_0020
     * @tc.name      Test systemTime.setTime Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setTime_0020', 0, async (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setTime_0020 start");
      try{
        console.info('====>SUB_Misc_systemTime_NoPermission_setTime_0020 setTime permission fail')
        let currentTime = new Date().getTime() + 2000
        await systemTime.setTime(currentTime);
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>SUB_Misc_systemTime_NoPermission_setTime_0020 setTime catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(-1);
        expect(err.message).assertContain("permission denied");
        done();
        console.info("====>SUB_Misc_systemTime_NoPermission_setTime_0020 end");
      }
    });

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setDate_0010
     * @tc.name      Test systemTime.setDate Invalid value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setDate_0010', 0, async (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setDate_0010 start");
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      systemTime.setDate(date, (err, data) => {
        try{
          if(err){
            console.info("====>SUB_Misc_systemTime_NoPermission_setDate_0010 setTime permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            done();
          }else{
            console.info('====>SUB_Misc_systemTime_NoPermission_setDate_0010 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>SUB_Misc_systemTime_NoPermission_setDate_0010 catch err: " + JSON.stringify(err));
          done();
          console.info("====>SUB_Misc_systemTime_NoPermission_setDate_0010 end");
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setDate_0020
     * @tc.name      Test systemTime.setDate true value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setDate_0020', 0, async (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setDate_0020 start");
      try{
        console.debug('====>SUB_Misc_systemTime_NoPermission_setDate_0020 setTime permission fail')
        let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
        await systemTime.setDate(date)
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>SUB_Misc_systemTime_NoPermission_setDate_0020 setTime catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(-1);
        expect(err.message).assertContain("permission denied");
        done();
        console.info("====>SUB_Misc_systemTime_NoPermission_setDate_0020 end");
      }
    });

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setTimezone_0010
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setTimezone_0010', 0, (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setTimezone_0010 start");
      systemTime.setTimezone('Asia/Jakarta', (err, data) => {
        try{
          if(err){
            console.info("====>SUB_Misc_systemTime_NoPermission_setTimezone_0010 setTime permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(-1);
            done();
          }else{
            console.info('====>SUB_Misc_systemTime_NoPermission_setTimezone_0010 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>SUB_Misc_systemTime_NoPermission_setTimezone_0010 catch error: " + JSON.stringify(err));
          done();
          console.info("====>SUB_Misc_systemTime_NoPermission_setTimezone_0010 end");
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_systemTime_NoPermission_setTimezone_0020
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_systemTime_NoPermission_setTimezone_0020', 0, async (done: Function) => {
      console.info("====>SUB_Misc_systemTime_NoPermission_setTimezone_0020 start");
      try{
        console.debug('====>SUB_Misc_systemTime_NoPermission_setTimezone_0020 setTime permission fail')
        await systemTime.setTimezone('Europe/Moscow')
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>SUB_Misc_systemTime_NoPermission_setTimezone_0020 setTime catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(-1);
        expect(err.message).assertContain("permission denied");
        done();
        console.info("====>SUB_Misc_systemTime_NoPermission_setTimezone_0020 end");
      }
    });

  });
};