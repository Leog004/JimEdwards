using System;
using System.Collections.Generic;
using System.Data;
using System.Runtime.CompilerServices;
using System.Web;
using MessageBird;


/*<summary>
 *  Leonel Garza 9/22/20
 * 
 *  Message Bird is an API that allows the clients to recieve sms messages
 *  This class for MessageBird Functionality is as follows
 *  
 *  Originatior(Reference Location):  The sender of the message. This can be a telephone number (including country code) or an alphanumeric string. 
 *  In case of an alphanumeric string, the maximum length is 11 characters.
 * 
 *  Body(Message): The body of the SMS message.
 * 
 *  recipients(PhoneNumber): An array of recipients msisdns.
 *  
 * </summary>
 */

public class MessageBirdApi
{

    public String ReferenceLocation { get; set; } // Our Originator
    public String Message { get; set; } // Our Body
    public long PhoneNumber { get; set; } // Recipients

    private String AccessCode = "DnSfA00BxAVs3HS4mX3K4nSJ0"; // Access Code | Can be located in our web.config file
    
    private List<Dictionary<String,Object>> Error_List; // List of errors

    public Object messageStatus;


    public MessageBirdApi(string ReferenceLocation, string Message, long PhoneNumber) // Default Constructor that takes three parameters
    {
        this.ReferenceLocation = ReferenceLocation;
        this.Message = Message;
        this.PhoneNumber = PhoneNumber;
    }


    private void setErrors(List<Dictionary<String, Object>> errors) // Setting our errors list
    {
        Error_List = errors;
    }


    public List<Dictionary<String,Object>> getErrorList() // retrieving error list
    {
        return Error_List;
    }

    public object getMessageStatus()
    {
        return messageStatus;
    }

    private void setMessageStatus(Object status)
    {
        messageStatus = status;
    }



    /*<SendMessageToCustomer>
     * 
     *  This function will return a boolean. The boolean will determine if the api succesfully sent our sms to the client.
     *  Will return true if success or false if there is an error.
     * 
     *  Our errors will be saved in our errorList variable
     * 
     * </SendMessageToCustomer>
     */

    public bool SendMessageToCustomer()
    {

        MessageBird.Net.ProxyConfigurationInjector.IProxyConfigurationInjector proxyConfigurationInjector = null; // for no web proxies, or web proxies not requiring authentication
        Client client = Client.CreateDefault(this.AccessCode, proxyConfigurationInjector);

        try
        {
            MessageBird.Objects.Message message = client.SendMessage(this.ReferenceLocation, this.Message, new[] { this.PhoneNumber });
            setMessageStatus(message);
        }
        catch (MessageBird.Exceptions.ErrorException e)
        {
            List<Dictionary<String, Object>> erros = new List<Dictionary<string, object>>();
            // Either the request fails with error descriptions from the endpoint.
            if (e.HasErrors)
            {

                int count = 0;

                foreach (MessageBird.Objects.Error error in e.Errors)
                {
                    string errorMessage = String.Format("code: {0} description: '{1}' parameter: '{2}'", error.Code, error.Description, error.Parameter);

                    erros.Add(new Dictionary<string, object>
                    {
                        { String.Format("Error {0}", count),  errorMessage}

                    });

                    count++;
                }
            }
            // or fails without error information from the endpoint, in which case the reason contains a 'best effort' description.
            if (e.HasReason)
            {

                erros.Add(new Dictionary<string, object>
                {
                    { "Error Has Reason: ",  e.Reason}
                });

            }

            setErrors(erros);

            return false;
        }


        return true;

    }


}