<p>There is a contact message from your website.</p>
<table>
    <tr>
        <th>Date:</th>
        <td>{{ $data['created_at'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Name:</th>
        <td>{{ $data['name'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Email:</th>
        <td>{{ $data['email'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Phone:</th>
        <td>{{ $data['phone'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Company:</th>
        <td>{{ $data['company'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Subject:</th>
        <td>{{ $data['subject'] ?? '' }}</td>
    </tr>
    <tr>
        <th>Message:</th>
        <td>{{ $data['message'] ?? '' }}</td>
    </tr>
</table>
