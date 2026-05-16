/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import systemLoad from '@ohos.resourceschedule.systemload';

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsSystemloadStaticTest() {

    describe("ActsSystemloadStaticTest", (): void => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'describe start');

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of LOW
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001 begin---');

          try {
            let level = systemLoad.SystemLoadLevel.LOW;
            hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001 systemload SystemLoadLevel: ' + level);
            expect(level).assertEqual(0);
            done();
          } catch (error) {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }

          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_001 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of NORMAL
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.NORMAL;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(1);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_002 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of MEDIUM
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.MEDIUM;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(2);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_003 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of HIGH
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.HIGH;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(3);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_004 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of OVERHEATED
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.OVERHEATED;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(4);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_005 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of WARNING
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.WARNING;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(5);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_006 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of EMERGENCY
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.EMERGENCY;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(6);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_007 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008
         * @tc.desc   Test that the systemLoad enum SystemLoadLevel of ESCAPE
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008 begin---');

            try {
                let level = systemLoad.SystemLoadLevel.ESCAPE;
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008 systemload SystemLoadLevel: ' + level);
                expect(level).assertEqual(7);
                done();
            } catch (error) {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008 aa error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }

            hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_008 end---');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009
         * @tc.desc   Test that the systemLoad on callback function normal call
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
         it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009 begin---');

             try {
                 let onSystemLoadChange = (res: systemLoad.SystemLoadLevel) => {
                     console.info(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009 system load changed, current level ` + res);
                 };
                 let callbackFlag = 0;

                 systemLoad.onSystemLoadChange(onSystemLoadChange);
                 console.info(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009 register systemload callback succeeded. `);
                 callbackFlag = 1;

                 expect(callbackFlag).assertEqual(1);
                 done();
             } catch (error) {
                 hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009 aa error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
             }

             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_009 end---');
         })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010
         * @tc.desc   Test that the systemLoad off callback function normal call
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
         it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010 begin---');

             try {
                 let offSystemLoadChange = (res: systemLoad.SystemLoadLevel) => {
                     console.info(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010 system load changed, current level ` + res);
                 };
                 let callbackFlag = 0;

                 systemLoad.offSystemLoadChange(offSystemLoadChange);
                 console.info(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010 register systemload callback succeeded. `);
                 callbackFlag = 1;

                 expect(callbackFlag).assertEqual(1);
                 done();
             } catch (error) {
                 hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010 aa error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
             }

             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_010 end---');
         })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011
         * @tc.name   SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011
         * @tc.desc   Test that the systemLoad getLevel promise function normal call
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
         it("SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011 begin---');

             try {
                 systemLoad.getLevel().then((res: systemLoad.SystemLoadLevel) => {
                     console.info(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011 getLevel promise succeeded. result: ` + JSON.stringify(res));
                     let level: int = res;
                     expect(level).assertLess(7);
                     done();
                 }).catch((err: Error) => {
                     console.error(`SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011 getLevel promise failed. code is ${err.code} message is ${err.message}`);
                     expect(false).assertTrue();
                     done();
                 })
             } catch (error) {
                 hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011 aa error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
             }

             hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SYSTEMLOAD_STATIC_XTS_011 end---');
         })

    })

}