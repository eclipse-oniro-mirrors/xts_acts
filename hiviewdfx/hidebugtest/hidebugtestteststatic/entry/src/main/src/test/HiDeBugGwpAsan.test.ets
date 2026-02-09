import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hidebug from '@ohos.hidebug'
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HidebuggwpasanTest() {

    describe("HidebuggwpasanTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testHidebuggwpasan_0100
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0100
         * @tc.desc   传入3个参数 alwaysEnabled: true 时间改为 10天
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHidebuggwpasan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0100 start");
            let options1: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
                sampleRate: 5000,
                maxSimutaneousAllocations: 5000,
            };
            try {
                console.info("testHidebuggwpasan_0100 start 01");
                hidebug.enableGwpAsanGrayscale(options1, 10);
                console.info("testHidebuggwpasan_0100 start 02");
                let state = hidebug.getGwpAsanGrayscaleState();
                console.log('testHidebuggwpasan_0100: ' + state);
                expect(state == 10).assertTrue();
                console.info("testHidebuggwpasan_0100 start 03");
                hidebug.disableGwpAsanGrayscale();
                console.info("testHidebuggwpasan_0100 start 04");
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0100 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
            console.info("testHidebuggwpasan_0100 end");
        })

        /**
         * @tc.name   testHidebuggwpasan_0200
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0200
         * @tc.desc   传入3个参数,alwaysEnabled: false,时间改为 10天
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0200 start");
            let options2: hidebug.GwpAsanOptions = {
                alwaysEnabled: false,
                sampleRate: 5000,
                maxSimutaneousAllocations: 5000,
            };
            try {
                console.info("testHidebuggwpasan_0200 start 01");
                hidebug.enableGwpAsanGrayscale(options2, 3);
                console.info("testHidebuggwpasan_0200 start 02");
                let state = hidebug.getGwpAsanGrayscaleState();
                console.log('testHidebuggwpasan_0200: ' + state);
                expect(state == 3).assertTrue();
                console.info("testHidebuggwpasan_0200 start 03");
                hidebug.disableGwpAsanGrayscale();
                console.info("testHidebuggwpasan_0200 start 04");
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0200 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
            console.info("testHidebuggwpasan_0200 end");
        })

        /**
         * @tc.name   testHidebuggwpasan_0400
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0400
         * @tc.desc   全部为默认值参数,alwaysEnabled为空值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
        */
        it('testHidebuggwpasan_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0400 start");
            try {
                console.info("testHidebuggwpasan_0400 start 01");
                hidebug.enableGwpAsanGrayscale();
                console.info("testHidebuggwpasan_0400 start 02");
                let state = hidebug.getGwpAsanGrayscaleState();
                console.log('testHidebuggwpasan_0400: ' + state);
                expect(state == 7).assertTrue();
                console.info("testHidebuggwpasan_0400 start 03");
                hidebug.disableGwpAsanGrayscale();
                console.info("testHidebuggwpasan_0400 start 04");
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0400 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
            console.info("testHidebuggwpasan_0400 end");
        })

        /**
         * @tc.name   testHidebuggwpasan_0500
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0500
         * @tc.desc   默认值为undefined,抛出错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0500 start");
            let options6: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
                sampleRate: -1
            };
            try {
                console.info("testHidebuggwpasan_0500 start 01");
                hidebug.enableGwpAsanGrayscale(options6,5);
                expect().assertFail()
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0500 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.info("testHidebuggwpasan_0500 end");
        })

        /**
         * @tc.name   testHidebuggwpasan_0600
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0600
         * @tc.desc   全部为默认值参数,options传入一个参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0600 start");
            let options6: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
            };
            try {
                console.info("testHidebuggwpasan_0600 start 01");
                hidebug.enableGwpAsanGrayscale(options6);
                console.info("testHidebuggwpasan_0600 start 02");
                hidebug.disableGwpAsanGrayscale();
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0600 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFalse();
                done();
            }
            console.info("testHidebuggwpasan_0600 end");
        })


        /**
         * @tc.name   testHidebuggwpasan_0700
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0700
         * @tc.desc   全部为默认值参数,options传入两个参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0700 start");
            let options7: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
                sampleRate: 1200
            };
            try {
                console.info("testHidebuggwpasan_0700 start 01");
                hidebug.enableGwpAsanGrayscale(options7);
                console.info("testHidebuggwpasan_0700 start 02");
                hidebug.disableGwpAsanGrayscale();
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0700 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFalse();
                done();
            }
            console.info("testHidebuggwpasan_0700 end");
        })


        /**
         * @tc.name   testHidebuggwpasan_0800
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0800
         * @tc.desc   全部为默认值参数,options传入参数sampleRate为0,抛出错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0800 start");
            let options8: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
                sampleRate: 0,
            };
            try {
                console.info("testHidebuggwpasan_0800 start 01");
                hidebug.enableGwpAsanGrayscale(options8);
                expect().assertFalse()
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0800 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.info("testHidebuggwpasan_0800 end");
        })


        /**
         * @tc.name   testHidebuggwpasan_0900
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0900
         * @tc.desc   全部为默认值参数,options传入参数maxSimutaneousAllocations为0,抛出错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_0900 start");
            let options9: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
                sampleRate: 5000,
                maxSimutaneousAllocations: 0,
            };
            try {
                console.info("testHidebuggwpasan_0900 start 01");
                hidebug.enableGwpAsanGrayscale(options9);
                expect().assertFalse()
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_0900 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.info("testHidebuggwpasan_0900 end");
        })

        /**
         * @tc.name   testHidebuggwpasan_1000
         * @tc.number SUB_DFX_DFR_Third_Asan_Interface_1000
         * @tc.desc   全部为默认值参数,传入参数天数为0,抛出错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHidebuggwpasan_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("testHidebuggwpasan_1000 start");
            let options10: hidebug.GwpAsanOptions = {
                alwaysEnabled: true,
            };
            try {
                console.info("testHidebuggwpasan_1000 start 01");
                hidebug.enableGwpAsanGrayscale(options10,0);
                expect().assertFalse()
                done();
            } catch (err: BusinessError) {
                console.info(`testHidebuggwpasan_1000 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.info("testHidebuggwpasan_1000 end");
        })


    })

}