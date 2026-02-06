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
import AlphabetTest from './AlphabetIndexerTest/alphabetTest.test';
import ActsAlphabetIndexerUxTest from './AlphabetIndexerTest/AlphabetIndexer.test'
import AlphabetIndexerJsunit from './AlphabetIndexerTest/AlphabetIndexerJsunit.test';
import AlphabetIndexerOnSelectJsunit from './AlphabetIndexerTest/AlphabetIndexerAPI.test';
import alphabetEnableJsunit from './AlphabetIndexerTest/alphabetEnableJsunit.test';
import alphabetBorderRadiusTest from './AlphabetIndexerTest/alphabetBorderRadius.test';
import alphabetAlignStyle from './AlphabetIndexerTest/alphabetAlignStyle.test';
import outliersAlphabet from './AlphabetIndexerTest/outliersAlphabet.test';
import valueAlphabet from './AlphabetIndexerTest/valueAlphabet.test';
import PopupAlphaTest from './AlphabetIndexerTest/PopupAlpha.test';

export default function testsuite() {
    AlphabetTest();
    ActsAlphabetIndexerUxTest();
    AlphabetIndexerOnSelectJsunit();
    alphabetEnableJsunit();
    alphabetBorderRadiusTest();
    alphabetAlignStyle();
    outliersAlphabet();
    valueAlphabet();
    PopupAlphaTest();
    AlphabetIndexerJsunit();
}