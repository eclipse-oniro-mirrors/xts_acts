/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import hidebug from '@ohos.hidebug'
import fileio from '@ohos.fileio'
import process from '@ohos.process'
import featureAbility from '@ohos.ability.featureAbility'
import {describe, it, expect} from '@ohos/hypium'

export default function HidebugJsTest() {
describe('HidebugJsTest', function () {

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0600
     * @tc.name      : getNativeHeapSize
     * @tc.desc      : Get total native heap memory size
     */
    it('DFX_DFR_Hiprofiler_Interface_0600', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0600 Test start*************');
        try {
            let heapSize = hidebug.getNativeHeapSize();
            expect(heapSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0600 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0400
     * @tc.name      : getNativeHeapAllocatedSize
     * @tc.desc      : Get Native heap memory allocation size.
     */
    it('DFX_DFR_Hiprofiler_Interface_0400', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0400 Test start*************');
        try {
            let heapAllocatedSize = hidebug.getNativeHeapAllocatedSize();
            expect(heapAllocatedSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0400 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0500
     * @tc.name      : getNativeHeapFreeSize
     * @tc.desc      : Get Native heap memory free size
     */
    it('DFX_DFR_Hiprofiler_Interface_0500', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0500 Test start*************');
        try {
            let heapFreeSize = hidebug.getNativeHeapFreeSize();
            expect(heapFreeSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0500 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0800
     * @tc.name      : getPss
     * @tc.desc      : Get application process proportional set size memory information
     */
    it('DFX_DFR_Hiprofiler_Interface_0800', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0800 Test start*************');
        try {
            const times = 3;
            let pssValue = BigInt(0);
            for(let i = 0; i < times; i++){
                let arr = new Array(i*100000).fill(1);
                let tmp = hidebug.getPss();
                console.info('No.' + i + ' tmp: ' + tmp);
                expect(tmp).assertLarger(pssValue);
                pssValue = tmp;
            }
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0800 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1200
     * @tc.name      : getSharedDirty
     * @tc.desc      : Obtains the size of the shared dirty memory of a process.
     */
    it('DFX_DFR_Hiprofiler_Interface_1200', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1200 Test start*************');
        try {
            let dirty = hidebug.getSharedDirty();
            let temp = hidebug.getSharedDirty();
            expect(dirty).assertEqual(temp);
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1200 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1600
     * @tc.name      : startProfiling with normal parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_1600', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1600 Test start*************');
        try {
            let timestamp = Date.now();
            let filename = 'cpuprofiler-' + timestamp.toString();
            console.info(filename);
            let path = '/data/app/el2/100/base/com.hidebug.test/files/' + filename + '.json'
            hidebug.startProfiling(filename);
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1600 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1500
     * @tc.name      : startProfiling repeatedly
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_1500', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1500 Test start*************');
        try {
            let path1 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-111.json'
            let path2 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-222.json'
            let path3 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-333.json'
            hidebug.startProfiling('cpuprofiler-111');
            hidebug.startProfiling('cpuprofiler-222');
            hidebug.startProfiling('cpuprofiler-333');
            let temp = 100;
            hidebug.stopProfiling();
            hidebug.stopProfiling();
            console.info('file is exists:', path1);
            console.info('file is exists:', path2);
            console.info('file is exists:', path3);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1500 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1400
     * @tc.name      : startProfiling with empty parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_1400', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1400 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.json'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        try {
            hidebug.startProfiling('');
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1400 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1300
     * @tc.name      : startProfiling with overlong parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_1300', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1300 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.json'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        let str = '';
        for (let i = 0; i < 1000; i++) {
            str += 'abcd';
        }
        try {
            hidebug.startProfiling(str);
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1300 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0300
     * @tc.name      : dumpHeapData with normal parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0300', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0300 Test start*************');
        try {
            let timestamp = Date.now();
            let filename = 'heap-' + timestamp.toString();
            console.info(filename);
            let path = '/data/app/el2/100/base/com.hidebug.test/files/' + filename + '.heapsnapshot'
            hidebug.dumpHeapData(filename);
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0300 Test end*************');
      });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0200
     * @tc.name      : dumpHeapData with empty parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0200', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0200 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.heapsnapshot'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        try {
            hidebug.dumpHeapData('');
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0200 Test end*************');
      });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0100
     * @tc.name      : dumpHeapData with overlog parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0100', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0100 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.heapsnapshot'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        let str = '';
        for (let i = 0; i < 1000; i++) {
            str += 'abcd';
        }
        try {
            hidebug.dumpHeapData(str);
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0100 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0700
     * @tc.name      : getPrivateDirty
     * @tc.desc      : Get the size of the private dirty memory
     */
    it('DFX_DFR_Hiprofiler_Interface_0700', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0700 Test start*************');
        try {
            let temp = hidebug.getPrivateDirty();
            expect(temp>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0700 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1700
     * @tc.name      : getCpuUsage
     * @tc.desc      : Get the cpu usage of a process
     */
    it('DFX_DFR_Hiprofiler_Interface_1700', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1700 Test start*************');
        try {
            let temp = -1;
            for(let i=0;i<=101;i++){
                for(let j=0;j<=101;j++){
                    if(i+j == 202){
                        temp = hidebug.getCpuUsage();
                        console.info("CpuUsage is " + temp);
                    }
                }
            }
            expect(temp>=0 && temp<=1).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1700 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1100
     * @tc.name      : getServiceDump with normal parameter
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_1100', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1100 Test start*************');
        let context = featureAbility.getContext();
        context.getFilesDir().then((data) => {
            var path = data + "/serviceInfo1.txt"
            let fd = fileio.openSync(path, 0o102, 0o666)
            var serviceId = 10
            var args = new Array("allInfo")
            try {
                hidebug.getServiceDump(serviceId, fd, args)
                expect(true).assertTrue();
            } catch (error) {
                expect().assertFail();
                console.info(error.code)
                console.info(error.message)
            }
            fileio.closeSync(fd);
        })
        console.log('************* DFX_DFR_Hiprofiler_Interface_1100 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0900
     * @tc.name      : getServiceDump with parameter error
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_0900', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0900 Test start*************');
        let context = featureAbility.getContext();
        context.getFilesDir().then((data) => {
            var path = data + "/serviceInfo2.txt"
            let fd = fileio.openSync(path, 0o102, 0o666)
            var serviceId = 10
            var args = new Array("allInfo")
            try {
                hidebug.getServiceDump(serviceId)
                expect().assertFail();
            } catch (error) {
                console.info(error.code)
                console.info(error.message)
                expect(error.code == 401).assertTrue();
            }
            fileio.closeSync(fd);
        })
        console.log('************* DFX_DFR_Hiprofiler_Interface_0900 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1000
     * @tc.name      : getServiceDump with check system ability failed
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_1000', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1000 Test start*************');
        let context = featureAbility.getContext();
        context.getFilesDir().then((data) => {
            var path = data + "/serviceInfo3.txt"
            let fd = fileio.openSync(path, 0o102, 0o666)
            var serviceId = -10
            var args = new Array("allInfo")
            try {
                hidebug.getServiceDump(serviceId, fd, args)
                expect().assertFail();
            } catch (error) {
                console.info(error.code)
                console.info(error.message)
                expect(error.code == 11400101).assertTrue();
            }
            fileio.closeSync(fd);
        })
        console.log('************* DFX_DFR_Hiprofiler_Interface_1000 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1800
     * @tc.name      : startJsCpuProfiling/stopJsCpuProfiling with normal parameter
     * @tc.desc      : startJsCpuProfiling/stopJsCpuProfiling
     */
     it('DFX_DFR_Hiprofiler_Interface_1800', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1800 Test start*************');
        try {
            let timestamp = Date.now();
            let filename = "cpuprofiler_" + timestamp.toString();
            hidebug.startJsCpuProfiling(filename);
            for (var i = 0; i < 3; i++) {
                hidebug.getSharedDirty();
            }
            hidebug.stopJsCpuProfiling();
            var pid = process.pid;
            let path = "/proc/" + pid + "/root/data/storage/el2/base/files/" + filename + ".json";
            let data = fileio.readTextSync(path);
            if (data.includes("napi")) {
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
        } catch (err) {
            console.error('DFX_DFR_Hiprofiler_Interface_1800 has failed for ' + err);
            expect(false).assertTrue();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1800 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_1900
     * @tc.name      : startJsCpuProfiling/stopJsCpuProfiling with abnormal parameter
     * @tc.desc      : startJsCpuProfiling/stopJsCpuProfiling
     */
     it('DFX_DFR_Hiprofiler_Interface_1900', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_1900 Test start*************');
        try {
            hidebug.startJsCpuProfiling();
            for (var i = 0; i < 3; i++) {
                hidebug.getSharedDirty();
            }
            hidebug.stopJsCpuProfiling();
        } catch (error) {
            console.info(error.code);
            console.info(error.message);
            expect(error.code == 401).assertTrue();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_1900 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_2000
     * @tc.name      : dumpJsHeapData with normal parameter
     * @tc.desc      : dumpJsHeapData
     */
     it('DFX_DFR_Hiprofiler_Interface_2000', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_2000 Test start*************');
        try {
            hidebug.dumpJsHeapData("heapData");
            expect(true).assertTrue();
        } catch (error) {
            console.info(error.code);
            console.info(error.message);
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_2000 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_2100
     * @tc.name      : dumpJsHeapData with abnormal parameter
     * @tc.desc      : dumpJsHeapData
     */
     it('DFX_DFR_Hiprofiler_Interface_2100', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_2100 Test start*************');
        try {
            hidebug.dumpJsHeapData();
        } catch (error) {
            console.info(error.code);
            console.info(error.message);
            expect(error.code == 401).assertTrue();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_2100 Test end*************');
    });

})
}
