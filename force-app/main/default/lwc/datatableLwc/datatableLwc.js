import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/DatatableLwcCtrl.getContacts';

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Mobile Phone', fieldName: 'MobilePhone', type : 'phone'},
    { label: 'Email', fieldName: 'Email', type: 'email' },
];
export default class DatatableLwc extends LightningElement {

    columns = columns;
    data = [];

    @wire(getContacts,{})
    result({error,data}){
        if(error)
            console.log(JSON.stringify(error));
        else
            this.data=data;
    }
}