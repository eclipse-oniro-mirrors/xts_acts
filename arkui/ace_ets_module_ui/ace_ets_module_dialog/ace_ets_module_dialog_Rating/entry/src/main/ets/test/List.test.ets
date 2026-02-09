/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import ratingStarStyle from './RatingTest/ratingStarStyle.test';
import ratingJsunit from './RatingTest/RatingJsunit.test';
import RatingUIJsunit from './RatingTest/RatingUIJsunit.test';
import rating3Jsunit from './RatingTest/Rating3Jsunit.test';
import RatingAdvancedTest from './RatingTest/RatingAdvanced.test'
import RatingContentModifier from './RatingTest/RatingContentModifier.test';
import RatingAdvancedTest2 from './RatingTest/RatingAdvanced2.test';
import ratingNodeTest from './rating/ratingNode.test';
import ratingOnChangeModifierTest from './rating/ratingOnChangeModifier.test';

export default function testsuite() {
  ratingStarStyle();
  ratingJsunit();
  RatingUIJsunit();
  rating3Jsunit();
  RatingAdvancedTest();
  RatingContentModifier();
  RatingAdvancedTest2();
  ratingNodeTest();
  ratingOnChangeModifierTest();




}