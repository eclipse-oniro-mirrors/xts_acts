/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foreach1 from './Foreach1/Foreach1.test';
import Foreach2 from './Foreach1/Foreach2.test';
import Foreach3 from './Foreach1/Foreach3.test';
import Foreach4 from './Foreach1/Foreach4.test';
import Foreach5 from './Foreach1/Foreach5.test';
import Foreach6 from './Foreach1/Foreach6.test';
import LazyForEachAdd from './LazyForEach/LazyForEachAdd.test';
import LazyForEachDelete from './LazyForEach/LazyForEachDelete.test';
import LazyForEachMove from './LazyForEach/LazyForEachMove.test';
import LazyForEachCacheEnhance from './LazyForEach/LazyForEachCacheEnhance.test';
import LazyForEachVisibleAreaChange from './LazyForEach/LazyForEachVisibleAreaChange.test';
import LazyForEachSingleBoolean from './LazyForEach/LazyForEachSingleBoolean.test';
import LazyForEachSingleNumber from './LazyForEach/LazyForEachSingleNumber.test';
import LazyForEachSingleString from './LazyForEach/LazyForEachSingleString.test';
import DataOperationTypeTest from './LazyForEach/DataOperationTypeTest.test';
import lazyChangeJsunit from './LazyForEach/lazyChangeJsunit.test';
import lazyReloadJsunit from './LazyForEach/lazyReloadJsunit.test';
import Prefetcher1 from './LazyForEach/Prefetcher1.test';
import Prefetcher2 from './LazyForEach/Prefetcher2.test';
import LazyForEachTest0470 from './LazyForEach/LazyForEachTest0470.test';
import LazyForEachTest0120 from './LazyForEach/LazyForEachTest0120.test';
import LazyForEachChangeTest0020 from './LazyForEach/LazyForEachChangeTest0020.test';
import LazyForEachInterface from './LazyForEach/LazyForEachInterface.test';
import LazyForEach001 from './LazyForEach/LazyForEach001.test';
import RepeatEachJsunit from './RepeatTest/RepeatEachJsunit.test';
import RepeatForeachNumberBool from './RepeatMix/RepeatForeachNumberBool.test';
import RepeatForeachString from './RepeatMix/RepeatForeachString.test';
import RepeatIfElseObject from './RepeatMix/RepeatIfElseObject.test';
import RepeatIfElseBoolean from './RepeatMix/RepeatIfElseBoolean.test';
import RepeatLazyForEachBooleanSource from './RepeatMix/RepeatLazyForEachBooleanSource.test';
import RepeatLazyForEachNumberSource from './RepeatMix/RepeatLazyForEachNumberSource.test';
import RepeatLazyForEachStringSource from './RepeatMix/RepeatLazyForEachStringSource.test';
import RepeatGridBoolean from './RepeatMixedComponent/RepeatGridBoolean.test';
import RepeatGridNumber from './RepeatMixedComponent/RepeatGridNumber.test';
import RepeatListBoolean from './RepeatMixedComponent/RepeatListBoolean.test';
import RepeatListNumber from './RepeatMixedComponent/RepeatListNumber.test';
import RepeatNestObject from './RepeatMix/RepeatNestObject.test';
import RepeatObservedV2Nest from './RepeatMix/RepeatObservedV2Nest.test';
import RepeatSwiperBoolean from './RepeatMixedComponent/RepeatSwiperBoolean.test';
import RepeatSwiperNumber from './RepeatMixedComponent/RepeatSwiperNumber.test';
import RepeatV1Boolean from './RepeatMix/RepeatV1Boolean.test';
import RepeatV1Object from './RepeatMix/RepeatV1Object.test';
import repeatCountJsunit from './RepeatTest/repeatCountJsunit.test';
import repeatKeyJsunit from './RepeatTest/repeatKeyJsunit.test';
import repeatNoTemplateIdJsunit from './RepeatTest/repeatNoTemplateIdJsunit.test';
import repeatVirtualScrollJsunit from './RepeatTest/repeatVirtualScrollJsunit.test';
import RepeatTest0040 from './RepeatTest/RepeatTest0040.test';
import RepeatTest0200 from './RepeatTest/RepeatTest0200.test';
import RepeatTest0020 from './RepeatTest/RepeatTest0020.test';
import RepeatTest0010 from './RepeatTest/RepeatTest0010.test';
import RepeatTest0400 from './RepeatTest/RepeatTest0400.test';
import RepeatwithAnimateTo from './RepeatTest/RepeatwithAnimateTo.test';
import IfElse001Test from './IfElseTest/IfElse001.test';
import IfElse002Test from './IfElseTest/IfElse002.test';
import IfElse003Test from './IfElseTest/IfElse003.test';
import IfElse004Test from './IfElseTest/IfElse004.test';
import IfElse005Test from './IfElseTest/IfElse005.test';
import IfElseTest0100 from './IfElseTest/IfElseTest0100.test';
import IfElse006 from './IfElseTest/IfElse006.test';
import ForEachTest010 from './foreachTest/ForEachTest010.test';
import ForEachTest030 from './foreachTest/ForEachTest030.test';
import ForEachTest0330 from './foreachTest/ForEachTest0330.test';
import ForEach001 from './foreachTest/ForEach001.test';
export default function testsuite() {
    Foreach1();
    Foreach2();
    Foreach3();
    Foreach4();
    Foreach5();
    Foreach6();
    LazyForEachAdd();
    LazyForEachDelete();
    LazyForEachMove();
    LazyForEachCacheEnhance();
    LazyForEachVisibleAreaChange();
    LazyForEachSingleBoolean();
    LazyForEachSingleNumber();
    LazyForEachSingleString();
    DataOperationTypeTest();
    lazyChangeJsunit();
    lazyReloadJsunit();
    Prefetcher1();
    Prefetcher2();
    LazyForEachTest0470();
    LazyForEachTest0120();
    LazyForEachChangeTest0020();
    LazyForEachInterface();
    LazyForEach001();
    RepeatEachJsunit();
    RepeatForeachNumberBool();
    RepeatForeachString();
    RepeatIfElseObject();
    RepeatIfElseBoolean();
    RepeatLazyForEachBooleanSource();
    RepeatLazyForEachNumberSource();
    RepeatLazyForEachStringSource();
    RepeatGridBoolean();
    RepeatGridNumber();
    RepeatListBoolean();
    RepeatListNumber();
    RepeatNestObject();
    RepeatObservedV2Nest();
    RepeatSwiperBoolean();
    RepeatSwiperNumber();
    RepeatV1Boolean();
    RepeatV1Object();
    repeatCountJsunit();
    repeatKeyJsunit();
    repeatNoTemplateIdJsunit();
    repeatVirtualScrollJsunit();
    RepeatTest0040();
    RepeatTest0200();
	RepeatTest0020();
    RepeatTest0010();
    RepeatTest0400();
    RepeatwithAnimateTo();
    IfElse001Test();
    IfElse002Test();
    IfElse003Test();
    IfElse004Test();
    IfElse005Test();
    IfElseTest0100();
    IfElse006();
    ForEachTest010();
    ForEachTest030();
    ForEachTest0330();
    ForEach001();
}
