/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {BusinessError } from '@kit.BasicServicesKit'
import {backgroundProcessManager } from '@kit.BackgroundTasksKit'
import hilog from '@ohos.hilog'
import {describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium'
import {process} from '@kit.ArkTS'
import {backgroundTaskManager} from '@kit.BackgroundTasksKit'

const TAG = "testTag";
const DOMAIN: number = 0x0000;

export default function ActsBackgroundProcessManagerNewTest() {
    describe("ActsBackgroundProcessManagerNewTest", () => {

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001
         * @tc.desc   setProcessPriority NULL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001 begin-------');

                try{
                    let pid = null;
                    backgroundProcessManager.setProcessPriority(pid,
                        backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_001 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002
         * @tc.desc   setProcessPriority undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002 begin-------');

                try{
                    let pid = undefined;
                    backgroundProcessManager.setProcessPriority(pid,
                        backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_002 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003
         * @tc.desc   resetProcessPriority undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003 begin-------');

                try{
                    let pid = undefined;
                    backgroundProcessManager.resetProcessPriority(pid);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NEW_XTS_003 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004
         * @tc.desc   resetProcessPriority NULL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004 begin-------');

                try{
                    let pid = null;
                    backgroundProcessManager.resetProcessPriority(pid);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_004 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005
         * @tc.desc   setPowerSaveMode undifined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005 begin-------');

                try{
                    let pid = undefined;
                    backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    }else{
                        expect(error.code == 801).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_005 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006
         * @tc.desc   setPowerSaveMode NULL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006 begin-------');

                try{
                    let pid = null;
                    backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    }else{
                        expect(error.code == 801).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_006 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007
         * @tc.desc   setPowerSaveMode powerSaveMode DEFAULT_MODE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007 begin-------');

                try{
                    let pid = process.pid;
                    backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.DEFAULT_MODE);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 801){
                        expect(error.code == 801).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_007 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008
         * @tc.desc   isPowerSaveMode undifined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008 begin-------');

                try{
                    let pid = undefined;
                    backgroundProcessManager.isPowerSaveMode(pid).then((result: boolean) => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008 isPowerSaveMode: " + result.toString());
                    });
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    } else if(error.code == 801){
                        expect(error.code == 801).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }
                }
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_008 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009
         * @tc.desc   isPowerSaveMode NULL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009 begin-------');

                try{
                    let pid = null;
                    backgroundProcessManager.isPowerSaveMode(pid).then((result: boolean) => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009 isPowerSaveMode: " + result.toString());
                    });
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    } else if(error.code == 801){
                        expect(error.code == 801).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }
                }
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_009 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010
         * @tc.desc   getPowerSaveMode undifined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010 begin-------');

                try{
                    let pid = undefined;
                    backgroundProcessManager.getPowerSaveMode(pid).then((result: backgroundProcessManager.PowerSaveMode) => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010 getPowerSaveMode: " + result.toString());
                    });
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    } else{
                        expect(error.code == 801).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011
         * @tc.desc   getPowerSaveMode null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011 begin-------');

                try{
                    let pid = null;
                    backgroundProcessManager.getPowerSaveMode(pid).then((result: backgroundProcessManager.PowerSaveMode) => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_010 getPowerSaveMode: " + result.toString());
                    });
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 31800002){
                        expect(error.code == 31800002).assertTrue();
                        done();
                    } else{
                        expect(error.code == 801).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_011 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012
         * @tc.desc   cancelSuspendDelay null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012 begin-------');

                try{
                    let id = null;
                    backgroundTaskManager.cancelSuspendDelay(id);

                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_012 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013
         * @tc.desc   cancelSuspendDelay undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013 begin-------');

                try{
                    let id = undefined;
                    backgroundTaskManager.cancelSuspendDelay(id);

                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_013 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014
         * @tc.desc   getRemainingDelayTime callback null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014 begin-------');

                try{
                    let id = null;
                    backgroundTaskManager.getRemainingDelayTime(id, (error: BusinessError, res: number) => {
                        console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014 callback => Operation getRemainingDelayTime succeeded.Data: ' + JSON.stringify(res));
                    });

                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_014 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015
         * @tc.desc   getRemainingDelayTime callback undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015 begin-------');

                try{
                    let id = undefined;
                    backgroundTaskManager.getRemainingDelayTime(id, (error: BusinessError, res: number) => {
                        console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015 callback => Operation getRemainingDelayTime succeeded.Data: ' + JSON.stringify(res));
                    });

                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_015 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016
         * @tc.desc   getRemainingDelayTime Promise undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016 begin-------');

                try{
                    let id = undefined;
                    backgroundTaskManager.getRemainingDelayTime(id).then((res: number) => {
                        console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016 Promise => Operation getRemainingDelayTime succeeded.Data: ' + JSON.stringify(res));
                    });
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_016 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017
         * @tc.desc   getRemainingDelayTime Promise null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017 begin-------');

                try{
                    let id = null;
                    backgroundTaskManager.getRemainingDelayTime(id).then((res: number) => {
                        console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017 Promise => Operation getRemainingDelayTime succeeded.Data: ' + JSON.stringify(res));
                    });
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_017 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018
         * @tc.desc   requestSuspendDelay null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 begin-------');

                try{
                    let reason = null;
                    let delayInfo = backgroundTaskManager.requestSuspendDelay(reason, () => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 requestSuspendDelay pass .");
                    });
                    let id = delayInfo.requestId;
                    let time = delayInfo.actualDelayTime;
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 The requestId is: " + id);
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 The actualDelayTime is :" + time);
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_018 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019
         * @tc.desc   requestSuspendDelay undifined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 begin-------');

                try{
                    let reason = null;
                    let delayInfo = backgroundTaskManager.requestSuspendDelay(reason, () => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 requestSuspendDelay pass .");
                    });
                    let id = delayInfo.requestId;
                    let time = delayInfo.actualDelayTime;
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 The requestId is: " + id);
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 The actualDelayTime is :" + time);
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_019 end-------')
            })

        /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020
         * @tc.desc   requestSuspendDelay empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 begin-------');

                try{
                    let reason = " ";
                    let delayInfo = backgroundTaskManager.requestSuspendDelay(reason, () => {
                        console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 Request suspension delay will time out.");
                    });
                    let id = delayInfo.requestId;
                    let time = delayInfo.actualDelayTime;
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 The requestId is: " + id);
                    console.info("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 The actualDelayTime is :" + time);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 has failed for' + error.message + 'code:' + error.code);
                    if (error.code == 401){
                        expect(error.code == 401).assertTrue();
                        done();
                    } else{
                        expect(false).assertTrue();
                        done();
                    }}
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_020 end-------')
            })

       /**
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021
         * @tc.desc   setProcessPriority PROCESS_BACKGROUND
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021", TestType.FUNCTION | Size.MEDIUMTEST |Level.LEVEL3,
            async (done: Function) => {
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021 begin-------');

                try{
                    let pid = process.pid;
                    backgroundProcessManager.setProcessPriority(pid, backgroundProcessManager.ProcessPriority.PROCESS_BACKGROUND);
                    done();
                }catch(error){
                    hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021 has failed for' + error.message + 'code:' + error.code);
                    expect(false).assertTrue();
                    done();
                    }
                hilog.info(DOMAIN, TAG, '%{public}s', '-------SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_021 end-------')
            })

    })
}