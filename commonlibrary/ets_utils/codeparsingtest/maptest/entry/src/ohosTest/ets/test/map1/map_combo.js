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

export function MapApiComboTest001(map){
    if (map.has('user2')) {
        const user = map.get('user2');
        map.set('user2', { ...user, active: true });
    }
}

export function MapApiComboTest003(){
    const map = new Map([
        ['id', 1001],
        ['name', 'Test'],
        ['valid', true]
    ]);
    return map;
}

export function MapApiComboTest004(inventory, id, amount){
    if (inventory.has(id)) {
        const item = inventory.get(id);
        inventory.set(id, { ...item, quantity: item.quantity + amount });
    }
}

export function MapApiComboTest005(original){
    return new Map(
        Array.from(original.entries()).filter(([key]) => key % 2 === 0)
    );
}
export function MapApiComboTest008(cache){
    cache.set('user:1', { ...cache.get('user:1'), ttl: Date.now() - 1 });
}
export function MapApiComboTest010(cart, item){
    cart.set(1, { ...item, quantity: 1 });
}
export function MapApiComboTest017(inventory, item, amount){
    const data = inventory.get(item);
    inventory.set(item, { ...data, reservedDate: data.reservedDate + amount });
}
export function MapApiComboTest019(formData, data){
    Object.assign(formData, data);
}
export function MapApiComboTest021(featureFlags, feature, userId){
    const { enabled, rollout } = featureFlags.get(feature);
    return enabled && (rollout === 100 || userId % 100 < rollout);
}
export function MapApiComboTest0211(featureFlags){
    featureFlags.set('newCheckout', { ...featureFlags.get('newCheckout'), rollout: 75 });
}
export function MapApiComboTest022(timeSeries){
    return Math.min(...timeSeries.keys());
}
export function MapApiComboTest024(taskQueue, taskId){
    taskQueue.set(taskId, { ...taskQueue.get(taskId), status: 'completed' });
}
export function MapApiComboTest028(userData){
    const ages = Array.from(userData.values()).map(u => u.age);
    return [Math.min(...ages), Math.max(...ages)];
}
export function MapApiComboTest031(quizAnswers){
    quizAnswers.set(2, { ...quizAnswers.get(2), userAnswer: 'C' });
}
export function MapApiComboTest032(events, id, event){
    events.set(id, { ...event, time: event.time + 86400000 });
}
export function MapApiComboTest033(rateLimits, userId, limit){
    rateLimits.set(userId, { ...limit, requests: limit.requests + 1 });
}
export function MapApiComboTest034(wishlist){
    return Array.from(wishlist.entries())
        .sort(([_, a], [__, b]) => {
            const priorityOrder = { high: 1, medium: 2, low: 3 };
            return priorityOrder[a.priority] - priorityOrder[b.priority] ||
                b.added - a.added; // Newest first for same priority
        });
}
export function MapApiComboTest038(projectTasks, taskId){
    projectTasks.set(taskId, { ...projectTasks.get(taskId), status: 'done' });
}
export function MapApiComboTest0381(projectTasks, id, task, to){
    projectTasks.set(id, { ...task, assignee: to });
}
export function MapApiComboTest040(options){
    return Math.min(...options.map(([_, o]) => o.votes));
}
export function MapApiComboTest041(priceUpdates, portfolio){
    priceUpdates.forEach(([ticker, price]) => {
        if (portfolio.has(ticker)) {
            const stock = portfolio.get(ticker);
            portfolio.set(ticker, { ...stock, currentPrice: price });
        }
    });
}
export function MapApiComboTest042(emailTemplates, id, updates){
    emailTemplates.set(id, { ...emailTemplates.get(id), ...updates });
}
export function MapApiComboTest045(courseProgress, courseId, lessonId, lesson, data){
    courseProgress.get(courseId).set(lessonId, {
        ...lesson,
        ...data,
        lastAccessed: Date.now()
    });
}
export function MapApiComboTest0451(courseProgress, courseId){
    if (!courseProgress.has(courseId)) return null;
    const lessons = Array.from(courseProgress.get(courseId).entries())
        .sort(([id1], [id2]) => id1 - id2);

    for (const [id, lesson] of lessons) {
        if (!lesson.completed) return id;
    }
    return null; // Course completed
}
export function MapApiComboTest046(devices, deviceId, prop, value){
    if (!devices.has(deviceId) || !devices.get(deviceId).hasOwnProperty(prop)) return false;
    const device = devices.get(deviceId);
    device[prop] = value;
    devices.set(deviceId, device);
    return true;
}
export function MapApiComboTest048(book){
    delete book.borrower;
    delete book.dueDate;
}
export function MapApiComboTest052(budget, lineItem, item, amount){
    budget.set(lineItem, { ...item, spent: item.spent + amount });
}
export function MapApiComboTest0521(budget){
    budget.set('design', { ...budget.get('design'), spent: 22000 });
}
export function MapApiComboTest053(pet){
    delete pet.adopter;
}
export function MapApiComboTest055(dailyShifts, time, shift, volunteer){
    dailyShifts.set(time, { ...shift, volunteer });
}
export function MapApiComboTest0551(shifts, date, time, shift){
    shifts.get(date).set(time, { ...shift, volunteer: null });
}
export function MapApiComboTest057(game){
    delete game.renter;
    delete game.dueDate;
}
export function MapApiComboTest061(item){
    delete item.renter;
    delete item.returnDate;
}
export function MapApiComboTest0611(gear, type, minCondition){
    const conditionOrder = { new: 3, used: 2, damaged: 1 };
    const available = [];
    gear.forEach((item, id) => {
        if (item.available && item.type === type && conditionOrder[item.condition] >= conditionOrder[minCondition]) {
            available.push(id);
        }
    });
    return available;
}
export function MapApiComboTest0612(gear){
    const costMap = { new: 200, used: 100, damaged: 50 };
    let total = 0;
    gear.forEach(item => {
        total += costMap[item.condition];
    });
    return total;
}
export function MapApiComboTest062(book){
    delete book.borrower;
}
export function MapApiComboTest063(dayData, type, data, multiplier){
    dayData.set(type, { ...data, cost: data.usage * multiplier });
}
export function MapApiComboTest065(tool){
    delete tool.borrower;
    delete tool.dueDate;
}
export function MapApiComboTest077(textMap, targetLang, entry){
    textMap.set(targetLang, { ...entry, lastUsed: Date.now() });
}
export function MapApiComboTest086(equipment){
    delete equipment.renter;
    delete equipment.rentalEnd;
}
export function MapApiComboTest087(ing, categoryValue){
    const unitCost = { 'kg': 10, 'pieces': 1 }; // Simplified cost model
    const value = ing.quantity * unitCost[ing.unit];
    categoryValue.set(ing.category, (categoryValue.get(ing.category) || 0) + value);
}
export function MapApiComboTest091(bike){
    delete bike.user;
    delete bike.checkoutTime;
}
export function MapApiComboTest093(booth){
    delete booth.category;
}
export function getKeys(map){
    return [...map.keys()];
}
export function getvalues(map){
    return [...map.values()];
}