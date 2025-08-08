import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'Notification'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUITE_NAME = 'ActsEmitterPublishTest'

export default function ActsNotificationEmitterPublishTest() {
    let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    describe("ActsNotificationEmitterPublishTest", (): void => {
        hilog.info(domain, TAG, '%{public}s', 'describe start');

        /*
          * @tc.number : Sub_Notification_Emitter_Publish_Emit_Static_0500
          * @tc.name   : Sub_Notification_Emitter_Publish_Emit_Static_0500
          * @tc.desc   : emitter.on 1   emitter.off 1   emitter.emit 1
          * @tc.size   : MediumTest
          * @tc.type   : Function
          * @tc.level  : Level 2
          */
        it('Sub_Notification_Emitter_Publish_Emit_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0500'
            let eventId01: emitter.InnerEvent = {
                eventId: 1
            };
            let num : number = 0
            let callback01 = (): void => {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback01 success');
                num++;
                expect(false).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
                emitter.on(eventId01, callback01);
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
                emitter.off(1);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                emitter.emit(eventId01);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
                await Utils.msSleep(1000);
                expect(num == 0).assertTrue()
                done();
            }catch(err){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })

        /*
          * @tc.number : Sub_Notification_Emitter_Publish_Emit_Static_0600
          * @tc.name   : Sub_Notification_Emitter_Publish_Emit_Static_0600
          * @tc.desc   : emitter.once 1   emitter.off 1   emitter.emit 1
          * @tc.size   : MediumTest
          * @tc.type   : Function
          * @tc.level  : Level 2
          */
        it('Sub_Notification_Emitter_Publish_Emit_Static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0600'
            let eventId02: emitter.InnerEvent = {
                eventId: 2
            };
            let num : number = 0
            let callback02 = (): void => {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
                num++;
                expect(false).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
                emitter.once(eventId02, callback02);
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
                emitter.off(2);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                emitter.emit(eventId02);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
                await Utils.msSleep(1000);
                expect(num == 0).assertTrue()
                done();
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })

        /*
          * @tc.number : Sub_Notification_Emitter_Publish_Emit_Static_0700
          * @tc.name   : Sub_Notification_Emitter_Publish_Emit_Static_0700
          * @tc.desc   : emitter.on 1   emitter.off 2   emitter.emit 1
          * @tc.size   : MediumTest
          * @tc.type   : Function
          * @tc.level  : Level 2
          */
        //问题单号：DTS2025060711369
        it('Sub_Notification_Emitter_Publish_Emit_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0700'
            let eventId03: string = '3';
            let num : number = 0
            let callback03 = (): void => {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' eventId03 on success');
                num++;
                expect(true).assertTrue();
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
                emitter.on(eventId03, callback03);
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
                emitter.off('2');
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try{
                emitter.emit(eventId03);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
                await Utils.msSleep(1000);
                expect(num == 1).assertTrue()
                done();
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })

        /*
          * @tc.number : Sub_Notification_Emitter_Publish_Emit_Static_0800
          * @tc.name   : Sub_Notification_Emitter_Publish_Emit_Static_0800
          * @tc.desc   : emitter.once 1   emitter.off 1   emitter.emit 1
          * @tc.size   : MediumTest
          * @tc.type   : Function
          * @tc.level  : Level 2
          */
        //问题单号：DTS2025060711369
        it('Sub_Notification_Emitter_Publish_Emit_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0800'
            let eventId04: string = '4';
            let num : number = 0
            let callback04 = (): void => {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback04 success');
                num++;
                expect(true).assertTrue();
                done();
            }
            try{
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
                emitter.once(eventId04, callback04);
            }catch(err:BusinessError){
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
                emitter.off('2');
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
            } catch (err:BusinessError) {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ',
                    JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
            try {
                emitter.emit(eventId04);
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
                await Utils.msSleep(1000);
                expect(num == 1).assertTrue()
                done();
            } catch (err:BusinessError) {
                hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ',
                    JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })
    })
    hilog.info(domain, TAG, '%{public}s', 'ActsNotificationEmitterPublishTest end');
}