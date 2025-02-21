/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import RelativeContainer_Level from './RelativeContainer/RelativeContainer_Level/RelativeContainer_Level.test.ets';
 import RelativeContainer_Vertical from './RelativeContainer/RelativeContainer_Vertical/RelativeContainer_Vertical.test.ets';
 import RelativeContainer_AnchorPoint_Absent from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Absent.test.ets';
 import RelativeContainer_AnchorPoint_Circular_Dependency from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Circular_Dependency.test.ets';
 import RelativeContainer_AnchorPoint_Interdependence from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Interdependence.test.ets';
 import RelativeContainer_AnchorPoint_Margin from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Margin.test.ets';
 import RelativeContainer_AnchorPoint_Padding from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Padding.test.ets';
 import RelativeContainer_AnchorPoint_ThreeDirection from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_ThreeDirection.test.ets';
 import RelativeContainer_AnchorPoint_TwoDirection from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_TwoDirection.test.ets';
 import RelativeContainer_AnchorPoint_Visibility_Hidden from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_Hidden.test.ets';
 import RelativeContainer_AnchorPoint_Visibility_None from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_None.test.ets';
 import RelativeContainer_AnchorPoint_NoId from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_NoId.test.ets';
 import RelativeContainer_AnchorPoint_Id_Null from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Null.test.ets';
 import RelativeContainer_AnchorPoint_Id_Undefined from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Undefined.test.ets';
 import RelativeContainer_AnchorPoint_Offset from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Offset.test.ets';
 import RelativeContainer_AnchorPoint_Position from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Position.test.ets';

export default function testsuite() {
 
RelativeContainer_Level()
RelativeContainer_Vertical()
RelativeContainer_AnchorPoint_Absent()
RelativeContainer_AnchorPoint_Circular_Dependency()
RelativeContainer_AnchorPoint_Interdependence()
RelativeContainer_AnchorPoint_Margin()
RelativeContainer_AnchorPoint_Padding()
RelativeContainer_AnchorPoint_ThreeDirection()
RelativeContainer_AnchorPoint_TwoDirection()
RelativeContainer_AnchorPoint_Visibility_Hidden()
RelativeContainer_AnchorPoint_Visibility_None()
RelativeContainer_AnchorPoint_NoId()
RelativeContainer_AnchorPoint_Id_Null()
RelativeContainer_AnchorPoint_Id_Undefined()
RelativeContainer_AnchorPoint_Offset()
RelativeContainer_AnchorPoint_Position()
 
}