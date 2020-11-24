import { LightningElement } from 'lwc';

export default class MeetingRooms extends LightningElement {
    meetingRoomsInfo = [
        {roomName: 'A-01',roomCapacity:'10'},
        {roomName: 'A-02',roomCapacity:'8'},
        {roomName: 'A-03',roomCapacity:'7'},
        {roomName: 'B-01',roomCapacity:'8'},
        {roomName: 'B-02',roomCapacity:'10'},
        {roomName: 'B-03',roomCapacity:'5'},
        {roomName: 'C-01',roomCapacity:'5'}
    ]
}