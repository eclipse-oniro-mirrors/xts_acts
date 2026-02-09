import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import webView from '@ohos.web.webview'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
let origin: string = "resource://rawfile/"

export default function webStorageTest() {

    describe("webStorageTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                testAbilityContext = abilitys.context
                console.info('onAbilityCreate end')
                },
            }, (err : BusinessError<void> | null) : void => {
                if (err != null) {
                    console.info('load error')
                    return;
                }
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebstoragetest.static")
            await Utils.msSleep(4000)
            console.info('beforeAll end,%s', 'Succeed!')
        })

        /**
         * @tc.name   testGetOrigins_static_001
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINS_0001
         * @tc.desc   test getOrigins
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOrigins_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins((error: BusinessError<void>|null, origins: webView.WebStorageOrigin[] | undefined) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        return;
                    }
                    if (origins == null || origins.length == 0) {
                        expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'testGetOrigins_static_001 origins.length: ' + origins.length);
                    for (let i = 0; i < origins.length; i++) {
                        hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                        hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                    }
                    expect(origins![0].origin == "resource://rawfile/").assertTrue();
                    expect(origins![0].usage > 0).assertTrue();
                    expect(origins![0].quota != 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOrigins_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testGetOrigins_static_002
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINS_0002
         * @tc.desc   test getOrigins
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOrigins_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins()
                    .then((origins: webView.WebStorageOrigin[]) => {
                        hilog.info(domain, tag, '%{public}s', 'testGetOrigins_static_002 origins.length: ' + origins.length);
                        expect(origins!.length > 0).assertTrue();
                        for (let i = 0; i < origins.length; i++) {
                            hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                            hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                            hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                        }
                        expect(origins![0].origin == "resource://rawfile/").assertTrue();
                        expect(origins![0].usage > 0).assertTrue();
                        expect(origins![0].quota != 0).assertTrue();
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOrigins_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testGetOriginUsage_static_001
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0001
         * @tc.desc   test getOriginUsage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOriginUsage_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin, (error: BusinessError<void> | null, usage: Double | undefined) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        return;
                    }
                    if (usage == null) {
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'usage: ' + usage);
                    expect(usage! > 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginUsage_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testGetOriginUsage_static_002
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0002
         * @tc.desc   test getOriginUsage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOriginUsage_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage: Double) => {
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + usage);
                        expect(usage! > 0).assertTrue();
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginUsage_static_002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testGetOriginQuota_static_001
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0001
         * @tc.desc   test getOriginQuota
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOriginQuota_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin, (error: BusinessError<void> | null, quota: Double | undefined) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        return;
                    }
                    if (quota == null) {
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota_static_001 quota: ' + quota);
                    expect(quota! != 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testGetOriginQuota_static_002
         * @tc.number SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0002
         * @tc.desc   test getOriginQuota
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetOriginQuota_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin)
                    .then((quota : Double) => {
                        hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota_static_002 quota: ' + quota);
                        expect(quota! != 0).assertTrue();
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota_static_002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testDeleteOrigin_static_001
         * @tc.number SUB_WEB_WEBSTORAGE_DELETEORIGIN_0001
         * @tc.desc   test deleteOrigin
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDeleteOrigin_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteOrigin(origin);
                await Utils.msSleep(2000);
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage : Double) => {
                        hilog.info(domain, tag, '%{public}s', 'testDeleteOrigin_static_001usage: ' + usage);
                        expect(usage! == 0).assertTrue();
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testDeleteOrigin_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.name   testDeleteAllData_static_001
         * @tc.number SUB_WEB_WEBSTORAGE_DELETEALLDATA_0001
         * @tc.desc   test deleteAllData
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDeleteAllData_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteAllData();
                await Utils.msSleep(2000);
                webView.WebStorage.getOrigins((error: BusinessError<void> | null, origins: webView.WebStorageOrigin[] | undefined) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        return;
                    }
                    if (origins == null || origins.length == 0) {
                        expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'testDeleteAllData_static_001 origins length: ' + origins.length);
                    for (let i = 0; i < origins.length; i++) {
                        hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                        hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                    }
                    expect(origins![0].usage == 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testDeleteAllData_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })
    })

}