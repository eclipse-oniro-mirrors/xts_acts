/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import { Driver, ON } from '@kit.TestKit';
const driver = Driver.create();
export default function webCursiveFont() {

  describe('webCursiveFont', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebCursiveFontCursive001
     * @tc.number SUB_WEB_WEBCURSIVEFONT_CURSIVE_0100
     * @tc.desc   test webCursiveFont with 'cursive' font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontCursive001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:()=>void):Promise<void> =>{
        Utils.emitEvent('testWebCursiveFontCursive001', 150207)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebCursiveFontCursive001','\"sans-serif\"', 20260311,done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebCursiveFontButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testWebCursiveFontCursive002
     * @tc.number SUB_WEB_WEBCURSIVEFONT_CURSIVE_0200
     * @tc.desc   test webCursiveFont with 'undefined' font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontCursive002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:()=>void):Promise<void> =>{
        Utils.emitEvent('testWebCursiveFontCursive002', 150207)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebCursiveFontCursive002','\"sans-serif\"', 20260312,done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebCursiveFontButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(5000);
        done();
      })




  })
}