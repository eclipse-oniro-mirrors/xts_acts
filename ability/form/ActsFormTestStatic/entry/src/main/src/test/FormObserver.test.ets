/*
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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import formObserver from '@ohos.app.form.formObserver';
import formInfo from '@ohos.app.form.formInfo';
import Utils from './Util.test';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formObserverTest';
const ERROR_CODE202 = 202;

export default function formObserverTest() {
    describe("formObserverTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formObserverTest describe start');

        /**
         * @tc.name   formObserverStaticTest001
         * @tc.number formObserverStaticTest001
         * @tc.desc   check FormObserver getRunningFormInfoById callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest001 start');
            let formId: string = '3610022740';
            try {
                formObserver.getRunningFormInfoById(formId, (error: BusinessError<void> | null, data: formInfo.RunningFormInfo | undefined) => {
                    if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest001 callback error, code:${error?.code}`);
                        expect(error?.code).assertEqual(ERROR_CODE202);
                        done();
                    } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest001 callback success`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest001 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest001 end');
        })

        /**
         * @tc.name   formObserverStaticTest002
         * @tc.number formObserverStaticTest002
         * @tc.desc   check FormObserver getRunningFormInfoById promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest002 start');
            let formId: string = '3610022740';
            try {
                formObserver.getRunningFormInfoById(formId).then((data) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest002 promise success`);
                    expect().assertFail();
                    done();
                }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest002 promise error, code: ${code}`);
                    expect(code).assertEqual(ERROR_CODE202);
                    done();
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest002 getRunningFormInfoById success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest002 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest002 end');
        })

        /**
         * @tc.name   formObserverStaticTest003
         * @tc.number formObserverStaticTest003
         * @tc.desc   check FormObserver getRunningFormInfoById with isUnusedIncluded callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest003 start');
            let formId: string = '3610022740';
            try {
                formObserver.getRunningFormInfoById(formId, true, (error: BusinessError<void> | null, data: formInfo.RunningFormInfo | undefined) => {
                    if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest003 callback error, code:${error?.code}`);
                        expect(error?.code).assertEqual(ERROR_CODE202);
                        done();
                    } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest003 callback success`);
                        expect().assertFail();
                        done();
                    }
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest003 getRunningFormInfoById  success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest003 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest003 end');
        })

        /**
         * @tc.name   formObserverStaticTest004
         * @tc.number formObserverStaticTest004
         * @tc.desc   check FormObserver getRunningFormInfoById with isUnusedIncluded promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest004 start');
            let formId: string = '3610022740';
            try {
                formObserver.getRunningFormInfoById(formId, true).then((data) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest004 promise success`);
                    expect().assertFail();
                    done();
                }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest004 promise error, code: ${code}`);
                    expect(code).assertEqual(ERROR_CODE202);
                    done();
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest004 getRunningFormInfoById success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest004 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest004 end');
        })

        /**
         * @tc.name   formObserverStaticTest005
         * @tc.number formObserverStaticTest005
         * @tc.desc   check FormObserver getRunningFormInfos with isUnusedIncluded callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest005 start');
            try {
                let hostBundleName: string = 'com.example.actsformtest.static';
                formObserver.getRunningFormInfos((error: BusinessError<void> | null, data: Array<formInfo.RunningFormInfo> | undefined) => {
                    if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest005 callback error, code:${error?.code}`);
                        expect(error?.code).assertEqual(ERROR_CODE202);
                        done();
                    } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest005 callback success`);
                        expect().assertFail();
                        done();
                    }
                }, true, hostBundleName);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest005 getRunningFormInfos success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest005 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest005 end');
        })

        /**
         * @tc.name   formObserverStaticTest006
         * @tc.number formObserverStaticTest006
         * @tc.desc   check FormObserver getRunningFormInfos with isUnusedIncluded promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest006 start');
            try {
                let hostBundleName: string = 'com.example.actsformtest.static';
                formObserver.getRunningFormInfos(true,hostBundleName).then((data: Array<formInfo.RunningFormInfo> | undefined ) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest006 promise success`);
                    expect().assertFail();
                    done();
                }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest006 promise error, code: ${code}`);
                    expect(code).assertEqual(ERROR_CODE202);
                    done();
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest006 getRunningFormInfos success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest006 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest006 end');
        })

        /**
         * @tc.name   formObserverStaticTest007
         * @tc.number formObserverStaticTest007
         * @tc.desc   check FormObserver getRunningFormInfos callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest007 start');
            try {
                let hostBundleName: string = 'com.example.actsformtest.static';
                formObserver.getRunningFormInfos((error: BusinessError<void> | null, data: Array<formInfo.RunningFormInfo> | undefined) => {
                    if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest007 callback error, code:${error?.code}`);
                        expect(error?.code).assertEqual(ERROR_CODE202);
                        done();
                    } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest007 callback success`);
                        expect().assertFail();
                        done();
                    }
                }, hostBundleName);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest007 getRunningFormInfos success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest007 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest007 end');
        })

        /**
         * @tc.name   formObserverStaticTest008
         * @tc.number formObserverStaticTest008
         * @tc.desc   check FormObserver getRunningFormInfos promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest008 start');
            try {
                let hostBundleName: string = 'com.example.actsformtest.static';
                formObserver.getRunningFormInfos(hostBundleName).then((data: Array<formInfo.RunningFormInfo> | undefined ) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest008 promise success`);
                    expect().assertFail();
                    done();
                }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest008 promise error, code: ${code}`);
                    expect(code).assertEqual(ERROR_CODE202);
                    done();
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest008 getRunningFormInfos success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest008 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest008 end');
        })

        /**
         * @tc.name   formObserverStaticTest009
         * @tc.number formObserverStaticTest009
         * @tc.desc   check FormObserver getRunningFormInfosByFilter promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest009 start');
            try {
                let formProviderFilter: formInfo.FormProviderFilter = {
                    bundleName: 'com.example.actsformtest.static',
                    moduleName: 'entry',
                    abilityName: 'EntryAbility',
                    formName: 'widget'
                };
                formObserver.getRunningFormInfosByFilter(formProviderFilter).then((data: Array<formInfo.RunningFormInfo> | undefined ) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest009 promise success`);
                    expect().assertFail();
                    done();
                }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest009 promise error, code: ${code}`);
                    expect(code).assertEqual(ERROR_CODE202);
                    done();
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest009 getRunningFormInfosByFilter success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest009 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest009 end');
        })

        /**
         * @tc.name   formObserverStaticTest010
         * @tc.number formObserverStaticTest010
         * @tc.desc   check FormObserver getRunningFormInfosByFilter callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest010 start');
            try {
                let formProviderFilter: formInfo.FormProviderFilter = {
                    bundleName: 'com.example.actsformtest.static',
                    moduleName: 'entry',
                    abilityName: 'EntryAbility',
                    formName: 'widget'
                };
                formObserver.getRunningFormInfosByFilter(formProviderFilter, (error: BusinessError<void> | null, data: Array<formInfo.RunningFormInfo> | undefined) => {
                    if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest010 callback error, code:${error?.code}`);
                        expect(error?.code).assertEqual(ERROR_CODE202);
                        done();
                    } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest010 callback success`);
                        expect().assertFail();
                        done();
                    }
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest010 getRunningFormInfosByFilter success');
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest010 catch error');
                expect().assertFail();
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest010 end');
        })

        /**
         * @tc.name   formObserverStaticTest011
         * @tc.number formObserverStaticTest011
         * @tc.desc   check FormObserver off call with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest011 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest011 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offCall(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest011 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest011 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest011 end');
        })

        /**
         * @tc.name   formObserverStaticTest012
         * @tc.number formObserverStaticTest012
         * @tc.desc   check FormObserver on call with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest012 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest012 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onCall(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest012 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest012 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest012 end');
        })

        /**
         * @tc.name   formObserverStaticTest013
         * @tc.number formObserverStaticTest013
         * @tc.desc   check FormObserver on call
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 start');
            try {
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest013 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onCall(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest013 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 end');
        })

        /**
         * @tc.name   formObserverStaticTest014
         * @tc.number formObserverStaticTest014
         * @tc.desc   check FormObserver off message with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest014 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offMessage(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest014 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 end');
        })

        /**
         * @tc.name   formObserverStaticTest015
         * @tc.number formObserverStaticTest015
         * @tc.desc   check FormObserver on message with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest015 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onMessage(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest015 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 end');
        })

        /**
         * @tc.name   formObserverStaticTest016
         * @tc.number formObserverStaticTest016
         * @tc.desc   check FormObserver on message
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest016 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onMessage(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest016 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 end');
        })

        /**
         * @tc.name   formObserverStaticTest017
         * @tc.number formObserverStaticTest017
         * @tc.desc   check FormObserver off router with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest017", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest017 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offRouter(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest017 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 end');
        })

        /**
         * @tc.name   formObserverStaticTest018
         * @tc.number formObserverStaticTest018
         * @tc.desc   check FormObserver on router with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest018", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest018 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onRouter(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest018 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 end');
        })

        /**
         * @tc.name   formObserverStaticTest019
         * @tc.number formObserverStaticTest019
         * @tc.desc   check FormObserver on router
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest019 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onRouter(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest019 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 end');
        })

        /**
         * @tc.name   formObserverStaticTest020
         * @tc.number formObserverStaticTest020
         * @tc.desc   check FormObserver off notifyInvisible with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest020 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offNotifyInvisible(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest020 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 end');
        })

        /**
         * @tc.name   formObserverStaticTest021
         * @tc.number formObserverStaticTest021
         * @tc.desc   check FormObserver off notifyVisible with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest021", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest021 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offNotifyVisible(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest021 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 end');
        })

        /**
         * @tc.name   formObserverStaticTest022
         * @tc.number formObserverStaticTest022
         * @tc.desc   check FormObserver on notifyInvisible with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest022", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest022 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onNotifyInvisible(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest022 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 end');
        })

        /**
         * @tc.name   formObserverStaticTest023
         * @tc.number formObserverStaticTest023
         * @tc.desc   check FormObserver on notifyVisible with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest023", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest023 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onNotifyVisible(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest023 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 end');
        })

        /**
         * @tc.name   formObserverStaticTest024
         * @tc.number formObserverStaticTest024
         * @tc.desc   check FormObserver on notifyInvisible
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest024", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest024 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onNotifyInvisible(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest024 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 end');
        })

        /**
         * @tc.name   formObserverStaticTest025
         * @tc.number formObserverStaticTest025
         * @tc.desc   check FormObserver on notifyVisible
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest025", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest025 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: Array<formInfo.RunningFormInfo> | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest025 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onNotifyVisible(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest025 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest025 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest025 end');
        })

        /**
         * @tc.name   formObserverStaticTest026
         * @tc.number formObserverStaticTest026
         * @tc.desc   check FormObserver off formRemove
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest026", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest026 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest026 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offFormRemove(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest026 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest026 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest026 end');
        })

        /**
         * @tc.name   formObserverStaticTest027
         * @tc.number formObserverStaticTest027
         * @tc.desc   check FormObserver on formRemove with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest027", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest027 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest027 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onFormRemove(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest027 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest027 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest027 end');
        })

        /**
         * @tc.name   formObserverStaticTest028
         * @tc.number formObserverStaticTest028
         * @tc.desc   check FormObserver on formRemove with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest028", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest028 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest028 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onFormRemove(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest028 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest028 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest028 end');
        })

        /**
         * @tc.name   formObserverStaticTest029
         * @tc.number formObserverStaticTest029
         * @tc.desc   check FormObserver off formAdd with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest029", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest029 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest029 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.offFormAdd(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest029 formObserver off success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest029 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest029 end');
        })

        /**
         * @tc.name   formObserverStaticTest030
         * @tc.number formObserverStaticTest030
         * @tc.desc   check FormObserver on formAdd with hostBundleName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest030", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest030 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest030 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onFormAdd(hostBundleName, observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest030 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest030 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest030 end');
        })

        /**
         * @tc.name   formObserverStaticTest031
         * @tc.number formObserverStaticTest031
         * @tc.desc   check FormObserver on formAdd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("formObserverStaticTest031", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest031 start');
            try {
                let hostBundleName: string = "com.example.actsformtest.static";
                let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest031 observerCallback success`);
                    expect().assertFail();
                    done();
                };
                formObserver.onFormAdd(observerCallback);
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest031 formObserver on success');
                expect().assertFail();
                done();
            } catch (error) {
                let code = (error as BusinessError).code;
                let message = (error as BusinessError).message;
                hilog.error(DOMAIN, TAG, `formObserverStaticTest031 catch error, code: ${code}, message: ${message})`);
                expect(error.code).assertEqual(ERROR_CODE202);
                done();
            }
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest031 end');
        })
    })
}